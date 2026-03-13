import 'package:recase/recase.dart';

class DomainTemplates {
  static String repository(String featureName) {
    final className = featureName.pascalCase;

    return '''
abstract interface class ${className}Repository {
  // TODO: Define repository contract
}
''';
  }
}
