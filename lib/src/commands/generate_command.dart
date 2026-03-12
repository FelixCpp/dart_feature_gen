import 'dart:async';
import 'dart:io' as io;

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:feature_gen/src/config/feature_config.dart';
import 'package:feature_gen/src/generators/feature_generator.dart';
import 'package:file/file.dart';
import 'package:mason_logger/mason_logger.dart';

class GenerateCommand extends Command<void> {
  GenerateCommand({
    required FileSystem fileSystem,
  }) : _logger = Logger(),
       _fileSystem = fileSystem {
    argParser.addOption(
      'path',
      abbr: 'p',
      defaultsTo: 'lib/features',
      help: 'Base path for feature generation (overrides feature_gen.yaml)',
    );

    argParser.addFlag(
      'build',
      defaultsTo: true,
      help: 'Run build_runner after generation (overrides feature_gen.yaml)',
    );

    argParser.addFlag(
      'format',
      defaultsTo: true,
      help: 'Run dart format after generation (overrides feature_gen.yaml)',
    );
  }

  final Logger _logger;
  final FileSystem _fileSystem;

  @override
  String get name => 'generate';

  @override
  String get description => 'Generates a new feature structure';

  @override
  FutureOr<void> run() async {
    final argResults = this.argResults;
    final args = argResults?.rest;
    if (argResults == null || args == null || args.isEmpty) {
      _logger.err(
        'Please provide a feature name. Usage: feature_gen generate <name>',
      );
      return;
    }

    final config = await ConfigLoader.load(
      workingDirectory: io.Directory.current.path,
      fileSystem: _fileSystem,
    );

    final mergedConfig = config.copyWith(
      basePath: argResults.read('path', 'lib/features'),
      format: argResults.read('format', true),
      buildRunner: argResults.read('build', true),
    );

    final generator = FeatureGenerator(
      logger: _logger,
      fileSystem: _fileSystem,
    );

    return generator.generate(
      featureName: args.first,
      config: mergedConfig,
    );
  }
}

extension on ArgResults {
  T read<T>(String key, T fallback) {
    if (wasParsed(key)) {
      return ([key] as T?) ?? fallback;
    }

    return fallback;
  }
}
