import 'package:dart_feature_gen/src/io/feature_gen_io.dart';
import 'package:dart_feature_gen/src/yaml/yaml_config_loader.dart';
import 'package:file/memory.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:test/test.dart';

void main() {
  group('find root directory', () {
    test('should find root directory', () async {
      final fileSystem = MemoryFileSystem.test();
      final logger = Logger(level: Level.quiet);
      final io = FeatureGenIO(fileSystem: fileSystem, logger: logger);

      final startingDirectory = await fileSystem
          .directory('root/level1/level2')
          .create(recursive: true);
      await fileSystem.file('root/pubspec.yaml').create(recursive: true);

      final dir = await findRootDirectory(
        io: io,
        startingDirectory: startingDirectory,
        targetFileName: 'pubspec.yaml',
      );

      expect(dir, isNotNull);
      expect(dir?.path, equals('root'));
    });

    test('should not find root directory due to missing file', () async {
      final fileSystem = MemoryFileSystem.test();
      final logger = Logger(level: Level.quiet);
      final io = FeatureGenIO(fileSystem: fileSystem, logger: logger);

      final startingDirectory = await fileSystem
          .directory('root/level1/level2')
          .create(recursive: true);

      final dir = await findRootDirectory(
        io: io,
        startingDirectory: startingDirectory,
        targetFileName: 'pubspec.yaml',
      );

      expect(dir, isNull);
    });
  });
}
