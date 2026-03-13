import 'package:recase/recase.dart';

abstract final class PresentationBlocTemplates {
  static String bloc(String featureName) {
    final className = featureName.pascalCase;

    return '''
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '${featureName}_bloc.freezed.dart';
part '${featureName}_event.dart';
part '${featureName}_state.dart';

class ${className}Bloc extends Bloc<${className}Event, ${className}State> {
  ${className}Bloc() : super(${className}State.initial()) {
    on<_OnSetup>(_onSetup);
  }

  FutureOr<void> _onSetup(_OnSetup event, Emitter<${className}State> emit) {
    // TODO: Implement
  }
}
''';
  }

  static String event(String featureName) {
    final className = featureName.pascalCase;

    return '''
part of '${featureName}_bloc.dart';

@freezed
sealed class ${className}Event with _\$${className}Event {
  const factory ${className}Event.onSetup() = _OnSetup;
}
''';
  }

  static String state(String featureName) {
    final className = featureName.pascalCase;

    return '''
part of '${featureName}_bloc.dart';

@freezed
sealed class ${className}State with _\$${className}State {
  const factory ${className}State() = _${className}State;

  factory ${className}State.initial() {
    return const ${className}State();
  }
}
''';
  }

  static String screen(String featureName) {
    final className = featureName.pascalCase;

    return '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/${featureName}_bloc.dart';

class ${className}Screen extends StatelessWidget {
  const ${className}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ${className}Bloc()..add(const ${className}Event.onSetup()),
      child: BlocBuilder<${className}Bloc, ${className}State>(
        builder: (context, state) {
          return _Scaffold(state: state);
        }
      ),
    );
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold({required this.state});

  final ${className}State state;

  @override
  Widget build(BuildContext state) {
    return const Placeholder();
  }
}
''';
  }
}

abstract final class PresentationCubitTemplates {
  static String cubit(String featureName) {
    final className = featureName.pascalCase;

    return '''
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '${featureName}_cubit.freezed.dart';
part '${featureName}_state.dart';

class ${className}Cubit extends Cubit<${className}State> {
  ${className}Cubit() : super(${className}State.initial());
}
''';
  }

  static String state(String featureName) {
    final className = featureName.pascalCase;

    return '''
part of '${featureName}_cubit.dart';

@freezed
sealed class ${className}State with _\$${className}State {
  const factory ${className}State() = _${className}State;

  factory ${className}State.initial() {
    return const ${className}State();
  }
}
''';
  }

  static String screen(String featureName) {
    final className = featureName.pascalCase;

    return '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/${featureName}_cubit.dart';

class ${className}Screen extends StatelessWidget {
  const ${className}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ${className}Cubit(),
      child: BlocBuilder<${className}Cubit, ${className}State>(
        builder: (context, state) {
          return _Scaffold(state: state);
        }
      ),
    );
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold({required this.state});

  final ${className}State state;

  @override
  Widget build(BuildContext state) {
    return const Placeholder();
  }
}
''';
  }
}
