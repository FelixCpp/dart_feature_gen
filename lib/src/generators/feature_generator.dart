import 'dart:io' as io;

import 'package:feature_gen/src/config/feature_config.dart';
import 'package:feature_gen/src/generators/data_generator.dart';
import 'package:feature_gen/src/generators/domain_generator.dart';
import 'package:feature_gen/src/generators/presentation_generator.dart';
import 'package:feature_gen/src/utility/process_runner.dart';
import 'package:file/file.dart';
import 'package:path/path.dart' as path;
import 'package:mason_logger/mason_logger.dart';

class FeatureGenerator {
  const FeatureGenerator({
    required this.logger,
    required this.fileSystem,
  });

  final Logger logger;
  final FileSystem fileSystem;

  String get workingDirectory => io.Directory.current.path;

  Future<void> generate({
    required String featureName,
    required FeatureGenConfig config,
  }) async {
    final featurePath = path.join(config.basePath, featureName);
    final processRunner = ProcessRunner(
      logger: logger,
      workingDirectory: workingDirectory,
      fileSystem: fileSystem,
    );

    final progress = logger.progress('Generating feature "$featureName"');
    try {
      await DataGenerator(
        featureName: featureName,
        basePath: config.basePath,
        fileSystem: fileSystem,
      ).generate();

      await DomainGenerator(
        featureName: featureName,
        basePath: config.basePath,
        fileSystem: fileSystem,
      ).generate();

      await PresentationGenerator(
        featureName: featureName,
        basePath: config.basePath,
        fileSystem: fileSystem,
      ).generate();

      progress.complete('Feature "$featureName" created successfully!');
    } catch (e) {
      progress.fail('Failed to generate feature: $e');
      return;
    }

    if (config.format) {
      await processRunner.runDartFormat(featurePath);
    } else {
      logger.info('Skipping code formatting (disabled via config)');
    }

    if (config.buildRunner) {
      if (await _hasBuildRunner()) {
        await processRunner.runBuildRunner(featurePath);
      } else {
        logger.info('Skipping build_runner (not found in pubspec.yaml)');
      }
    } else {
      logger.info('Skipping build_runner (disabled via config)');
    }
  }

  Future<bool> _hasBuildRunner() async {
    final pubspecFile = fileSystem.file(
      path.join(workingDirectory, 'pubspec.yaml'),
    );

    if (!await pubspecFile.exists()) {
      return false;
    }

    final content = await pubspecFile.readAsString();
    return content.contains('build_runner');
  }
}
