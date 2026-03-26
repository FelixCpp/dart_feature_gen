// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_gen_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeatureGenConfig {
  String get featureName;
  String? get featurePrefix;
  String get outputDirectory;
  StateManagement get stateManagement;
  DataClassFormat get dataClassFormat;
  bool get runCodeFormatter;
  bool get runCodeGenerator;

  /// Create a copy of FeatureGenConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeatureGenConfigCopyWith<FeatureGenConfig> get copyWith =>
      _$FeatureGenConfigCopyWithImpl<FeatureGenConfig>(
          this as FeatureGenConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeatureGenConfig &&
            (identical(other.featureName, featureName) ||
                other.featureName == featureName) &&
            (identical(other.featurePrefix, featurePrefix) ||
                other.featurePrefix == featurePrefix) &&
            (identical(other.outputDirectory, outputDirectory) ||
                other.outputDirectory == outputDirectory) &&
            (identical(other.stateManagement, stateManagement) ||
                other.stateManagement == stateManagement) &&
            (identical(other.dataClassFormat, dataClassFormat) ||
                other.dataClassFormat == dataClassFormat) &&
            (identical(other.runCodeFormatter, runCodeFormatter) ||
                other.runCodeFormatter == runCodeFormatter) &&
            (identical(other.runCodeGenerator, runCodeGenerator) ||
                other.runCodeGenerator == runCodeGenerator));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      featureName,
      featurePrefix,
      outputDirectory,
      stateManagement,
      dataClassFormat,
      runCodeFormatter,
      runCodeGenerator);

  @override
  String toString() {
    return 'FeatureGenConfig(featureName: $featureName, featurePrefix: $featurePrefix, outputDirectory: $outputDirectory, stateManagement: $stateManagement, dataClassFormat: $dataClassFormat, runCodeFormatter: $runCodeFormatter, runCodeGenerator: $runCodeGenerator)';
  }
}

/// @nodoc
abstract mixin class $FeatureGenConfigCopyWith<$Res> {
  factory $FeatureGenConfigCopyWith(
          FeatureGenConfig value, $Res Function(FeatureGenConfig) _then) =
      _$FeatureGenConfigCopyWithImpl;
  @useResult
  $Res call(
      {String featureName,
      String? featurePrefix,
      String outputDirectory,
      StateManagement stateManagement,
      DataClassFormat dataClassFormat,
      bool runCodeFormatter,
      bool runCodeGenerator});
}

/// @nodoc
class _$FeatureGenConfigCopyWithImpl<$Res>
    implements $FeatureGenConfigCopyWith<$Res> {
  _$FeatureGenConfigCopyWithImpl(this._self, this._then);

  final FeatureGenConfig _self;
  final $Res Function(FeatureGenConfig) _then;

  /// Create a copy of FeatureGenConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureName = null,
    Object? featurePrefix = freezed,
    Object? outputDirectory = null,
    Object? stateManagement = null,
    Object? dataClassFormat = null,
    Object? runCodeFormatter = null,
    Object? runCodeGenerator = null,
  }) {
    return _then(_self.copyWith(
      featureName: null == featureName
          ? _self.featureName
          : featureName // ignore: cast_nullable_to_non_nullable
              as String,
      featurePrefix: freezed == featurePrefix
          ? _self.featurePrefix
          : featurePrefix // ignore: cast_nullable_to_non_nullable
              as String?,
      outputDirectory: null == outputDirectory
          ? _self.outputDirectory
          : outputDirectory // ignore: cast_nullable_to_non_nullable
              as String,
      stateManagement: null == stateManagement
          ? _self.stateManagement
          : stateManagement // ignore: cast_nullable_to_non_nullable
              as StateManagement,
      dataClassFormat: null == dataClassFormat
          ? _self.dataClassFormat
          : dataClassFormat // ignore: cast_nullable_to_non_nullable
              as DataClassFormat,
      runCodeFormatter: null == runCodeFormatter
          ? _self.runCodeFormatter
          : runCodeFormatter // ignore: cast_nullable_to_non_nullable
              as bool,
      runCodeGenerator: null == runCodeGenerator
          ? _self.runCodeGenerator
          : runCodeGenerator // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [FeatureGenConfig].
extension FeatureGenConfigPatterns on FeatureGenConfig {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FeatureGenConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FeatureGenConfig() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FeatureGenConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeatureGenConfig():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FeatureGenConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeatureGenConfig() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String featureName,
            String? featurePrefix,
            String outputDirectory,
            StateManagement stateManagement,
            DataClassFormat dataClassFormat,
            bool runCodeFormatter,
            bool runCodeGenerator)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FeatureGenConfig() when $default != null:
        return $default(
            _that.featureName,
            _that.featurePrefix,
            _that.outputDirectory,
            _that.stateManagement,
            _that.dataClassFormat,
            _that.runCodeFormatter,
            _that.runCodeGenerator);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String featureName,
            String? featurePrefix,
            String outputDirectory,
            StateManagement stateManagement,
            DataClassFormat dataClassFormat,
            bool runCodeFormatter,
            bool runCodeGenerator)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeatureGenConfig():
        return $default(
            _that.featureName,
            _that.featurePrefix,
            _that.outputDirectory,
            _that.stateManagement,
            _that.dataClassFormat,
            _that.runCodeFormatter,
            _that.runCodeGenerator);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String featureName,
            String? featurePrefix,
            String outputDirectory,
            StateManagement stateManagement,
            DataClassFormat dataClassFormat,
            bool runCodeFormatter,
            bool runCodeGenerator)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeatureGenConfig() when $default != null:
        return $default(
            _that.featureName,
            _that.featurePrefix,
            _that.outputDirectory,
            _that.stateManagement,
            _that.dataClassFormat,
            _that.runCodeFormatter,
            _that.runCodeGenerator);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FeatureGenConfig implements FeatureGenConfig {
  const _FeatureGenConfig(
      {required this.featureName,
      required this.featurePrefix,
      required this.outputDirectory,
      required this.stateManagement,
      required this.dataClassFormat,
      required this.runCodeFormatter,
      required this.runCodeGenerator});

  @override
  final String featureName;
  @override
  final String? featurePrefix;
  @override
  final String outputDirectory;
  @override
  final StateManagement stateManagement;
  @override
  final DataClassFormat dataClassFormat;
  @override
  final bool runCodeFormatter;
  @override
  final bool runCodeGenerator;

  /// Create a copy of FeatureGenConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeatureGenConfigCopyWith<_FeatureGenConfig> get copyWith =>
      __$FeatureGenConfigCopyWithImpl<_FeatureGenConfig>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeatureGenConfig &&
            (identical(other.featureName, featureName) ||
                other.featureName == featureName) &&
            (identical(other.featurePrefix, featurePrefix) ||
                other.featurePrefix == featurePrefix) &&
            (identical(other.outputDirectory, outputDirectory) ||
                other.outputDirectory == outputDirectory) &&
            (identical(other.stateManagement, stateManagement) ||
                other.stateManagement == stateManagement) &&
            (identical(other.dataClassFormat, dataClassFormat) ||
                other.dataClassFormat == dataClassFormat) &&
            (identical(other.runCodeFormatter, runCodeFormatter) ||
                other.runCodeFormatter == runCodeFormatter) &&
            (identical(other.runCodeGenerator, runCodeGenerator) ||
                other.runCodeGenerator == runCodeGenerator));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      featureName,
      featurePrefix,
      outputDirectory,
      stateManagement,
      dataClassFormat,
      runCodeFormatter,
      runCodeGenerator);

  @override
  String toString() {
    return 'FeatureGenConfig(featureName: $featureName, featurePrefix: $featurePrefix, outputDirectory: $outputDirectory, stateManagement: $stateManagement, dataClassFormat: $dataClassFormat, runCodeFormatter: $runCodeFormatter, runCodeGenerator: $runCodeGenerator)';
  }
}

/// @nodoc
abstract mixin class _$FeatureGenConfigCopyWith<$Res>
    implements $FeatureGenConfigCopyWith<$Res> {
  factory _$FeatureGenConfigCopyWith(
          _FeatureGenConfig value, $Res Function(_FeatureGenConfig) _then) =
      __$FeatureGenConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String featureName,
      String? featurePrefix,
      String outputDirectory,
      StateManagement stateManagement,
      DataClassFormat dataClassFormat,
      bool runCodeFormatter,
      bool runCodeGenerator});
}

/// @nodoc
class __$FeatureGenConfigCopyWithImpl<$Res>
    implements _$FeatureGenConfigCopyWith<$Res> {
  __$FeatureGenConfigCopyWithImpl(this._self, this._then);

  final _FeatureGenConfig _self;
  final $Res Function(_FeatureGenConfig) _then;

  /// Create a copy of FeatureGenConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featureName = null,
    Object? featurePrefix = freezed,
    Object? outputDirectory = null,
    Object? stateManagement = null,
    Object? dataClassFormat = null,
    Object? runCodeFormatter = null,
    Object? runCodeGenerator = null,
  }) {
    return _then(_FeatureGenConfig(
      featureName: null == featureName
          ? _self.featureName
          : featureName // ignore: cast_nullable_to_non_nullable
              as String,
      featurePrefix: freezed == featurePrefix
          ? _self.featurePrefix
          : featurePrefix // ignore: cast_nullable_to_non_nullable
              as String?,
      outputDirectory: null == outputDirectory
          ? _self.outputDirectory
          : outputDirectory // ignore: cast_nullable_to_non_nullable
              as String,
      stateManagement: null == stateManagement
          ? _self.stateManagement
          : stateManagement // ignore: cast_nullable_to_non_nullable
              as StateManagement,
      dataClassFormat: null == dataClassFormat
          ? _self.dataClassFormat
          : dataClassFormat // ignore: cast_nullable_to_non_nullable
              as DataClassFormat,
      runCodeFormatter: null == runCodeFormatter
          ? _self.runCodeFormatter
          : runCodeFormatter // ignore: cast_nullable_to_non_nullable
              as bool,
      runCodeGenerator: null == runCodeGenerator
          ? _self.runCodeGenerator
          : runCodeGenerator // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
