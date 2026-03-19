import 'package:dart_feature_gen/src/io/feature_gen_io.dart';
import 'package:dart_feature_gen/src/yaml/yaml_feature_gen_config.dart';
import 'package:file/file.dart';
import 'package:path/path.dart' as path;
import 'package:mason_logger/mason_logger.dart';
import 'package:yaml/yaml.dart';

Future<Directory?> findRootDirectory({
  required FeatureGenIO io,
  required Directory startingDirectory,
  required String targetFileName,
}) async {
  var currentDirectory = startingDirectory;

  while (true) {
    final configFile = io.getFile(path.join(
      currentDirectory.path,
      targetFileName,
    ));

    if (await configFile.exists()) {
      return currentDirectory;
    }

    final parent = currentDirectory.parent;
    if (currentDirectory == parent) {
      return null;
    }

    currentDirectory = parent;
  }
}

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
    final rootDirectory = await findRootDirectory(
        io: io,
        startingDirectory: io.getCwdDir(),
        targetFileName: 'dart_feature_gen.yaml');

    if (configFile == null) {
      logger.warn('Config file not found.');
      return null;
    }

    final configFile =
        io.getFile(path.join(rootDirectory.path, 'dart_feature_gen.yaml'));

    logger.success('Config file has been found. Reading contents ...');
    final contents = await configFile.readAsString();
    return contents;
  }
}
