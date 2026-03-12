import 'package:file/file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

part 'feature_config.freezed.dart';

@freezed
sealed class FeatureGenConfig with _$FeatureGenConfig {
  const factory FeatureGenConfig({
    required String basePath,
    required bool format,
    required bool buildRunner,
  }) = _FeatureGenConfig;
}

class ConfigLoader {
  static const _configFileName = 'feature_gen.yaml';

  static Future<FeatureGenConfig> load({
    required String workingDirectory,
    required FileSystem fileSystem,
  }) async {
    final configFile = fileSystem.file(
      path.join(workingDirectory, _configFileName),
    );

    if (!await configFile.exists()) {
      return const FeatureGenConfig(
        basePath: 'lib/features',
        format: true,
        buildRunner: true,
      );
    }

    final contents = await configFile.readAsString();
    if (contents.trim().isEmpty) {
      return const FeatureGenConfig(
        basePath: 'lib/features',
        format: true,
        buildRunner: true,
      );
    }

    final yaml = loadYaml(contents);
    if (yaml! is Map) {
      return const FeatureGenConfig(
        basePath: 'lib/features',
        format: true,
        buildRunner: true,
      );
    }

    return FeatureGenConfig(
      basePath: yaml['basePath'] as String? ?? 'lib/features',
      format: yaml['format'] as bool? ?? true,
      buildRunner: yaml['buildRunner'] as bool? ?? true,
    );
  }
}
