import 'package:recase/recase.dart';

class DataTemplates {
  static String repositoryImpl(String featureName) {
    final className = featureName.pascalCase;

    return '''
import '../../domain/repositories/${featureName}_repository.dart';

class ${className}RepositoryImpl implements ${className}Repository {
  const ${className}RepositoryImpl();
}
''';
  }

  static String remoteDatasource(String featureName) {
    final className = featureName.pascalCase;
    return '''
abstract class ${className}RemoteDatasource {
  // TODO: Define datasource contract
}

class ${className}RemoteDatasourceImpl implements ${className}RemoteDatasource {
  // TODO: Implement datasource
}
''';
  }

  static String dao(String featureName) {
    final className = featureName.pascalCase;
    return '''
class ${className}Dao {
  // TODO: Implement DAO
}
''';
  }

  static String diModule(String featureName) {
    final className = featureName.pascalCase;
    return '''
// Dependency Injection for $className feature (data layer)
''';
  }
}
