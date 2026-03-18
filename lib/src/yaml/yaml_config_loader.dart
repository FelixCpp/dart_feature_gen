import 'package:dart_feature_gen/src/io/feature_gen_io.dart';
import 'package:dart_feature_gen/src/yaml/yaml_feature_gen_config.dart';
import 'package:file/file.dart';
import 'package:path/path.dart' as path;
import 'package:mason_logger/mason_logger.dart';
import 'package:yaml/yaml.dart';

class YamlConfigLoader {
  const YamlConfigLoader({
    required this.io,
    required this.logger,
  });

  final FeatureGenIO io;
  final Logger logger;

  Future<YamlFeatureGenConfig> loadConfig() async {
    final configFileContents = await readYamlConfigFile();
    if (configFileContents == null) {
      return YamlFeatureGenConfig(
        featurePrefix: null,
        outputDir: null,
        stateManagement: null,
        runCodeFormatter: null,
        runCodeGenerator: null,
      );
    }

    return loadConfigFromSource(configFileContents);
  }

  Future<YamlFeatureGenConfig> loadConfigFromSource(String source) async {
    Map yaml;
    try {
      yaml = loadYaml(source) as Map? ?? {};
    } catch (exception) {
      logger.err('Failed to decode configuration file (yaml): $exception');
      yaml = {};
    }

    return YamlFeatureGenConfig(
      featurePrefix: yaml['feature-prefix'] as String?,
      outputDir: yaml['output-dir'] as String?,
      stateManagement: yaml['state-management'] as String?,
      runCodeFormatter: yaml['code-format'] as bool?,
      runCodeGenerator: yaml['code-generate'] as bool?,
    );
  }

  Future<String?> readYamlConfigFile() async {
    final configFile = await findConfigFile();
    if (configFile == null) {
      logger.warn('Config file not found.');
      return null;
    }

    logger.success('Config file has been found. Reading contents ...');
    final contents = await configFile.readAsString();
    return contents;
  }

  Future<File?> findConfigFile({
    String configFileName = 'dart_feature_gen.yaml',
  }) async {
    Directory current = io.getCwdDir();

    while (true) {
      final configFile = io.getFile(path.join(current.path, configFileName));

      if (await configFile.exists()) {
        return configFile;
      }

      final pubspec = io.getFile(path.join(current.path, 'pubspec.yaml'));
      if (await pubspec.exists()) {
        return null;
      }

      final parent = current.parent;

      if (parent.path == current.path) {
        return null;
      }

      current = parent;
    }
  }
}
