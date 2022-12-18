// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routine_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Routine _$RoutineFromJson(Map<String, dynamic> json) {
  return _Routine.fromJson(json);
}

/// @nodoc
mixin _$Routine {
  String? get dayOfWeek => throw _privateConstructorUsedError;
  RoutineType? get type => throw _privateConstructorUsedError;
  bool? get isEnable => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoutineCopyWith<Routine> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutineCopyWith<$Res> {
  factory $RoutineCopyWith(Routine value, $Res Function(Routine) then) =
      _$RoutineCopyWithImpl<$Res, Routine>;
  @useResult
  $Res call(
      {String? dayOfWeek, RoutineType? type, bool? isEnable, String? detail});
}

/// @nodoc
class _$RoutineCopyWithImpl<$Res, $Val extends Routine>
    implements $RoutineCopyWith<$Res> {
  _$RoutineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = freezed,
    Object? type = freezed,
    Object? isEnable = freezed,
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RoutineType?,
      isEnable: freezed == isEnable
          ? _value.isEnable
          : isEnable // ignore: cast_nullable_to_non_nullable
              as bool?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoutineCopyWith<$Res> implements $RoutineCopyWith<$Res> {
  factory _$$_RoutineCopyWith(
          _$_Routine value, $Res Function(_$_Routine) then) =
      __$$_RoutineCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? dayOfWeek, RoutineType? type, bool? isEnable, String? detail});
}

/// @nodoc
class __$$_RoutineCopyWithImpl<$Res>
    extends _$RoutineCopyWithImpl<$Res, _$_Routine>
    implements _$$_RoutineCopyWith<$Res> {
  __$$_RoutineCopyWithImpl(_$_Routine _value, $Res Function(_$_Routine) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = freezed,
    Object? type = freezed,
    Object? isEnable = freezed,
    Object? detail = freezed,
  }) {
    return _then(_$_Routine(
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RoutineType?,
      isEnable: freezed == isEnable
          ? _value.isEnable
          : isEnable // ignore: cast_nullable_to_non_nullable
              as bool?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Routine with DiagnosticableTreeMixin implements _Routine {
  _$_Routine({this.dayOfWeek, this.type, this.isEnable, this.detail});

  factory _$_Routine.fromJson(Map<String, dynamic> json) =>
      _$$_RoutineFromJson(json);

  @override
  final String? dayOfWeek;
  @override
  final RoutineType? type;
  @override
  final bool? isEnable;
  @override
  final String? detail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Routine(dayOfWeek: $dayOfWeek, type: $type, isEnable: $isEnable, detail: $detail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Routine'))
      ..add(DiagnosticsProperty('dayOfWeek', dayOfWeek))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('isEnable', isEnable))
      ..add(DiagnosticsProperty('detail', detail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Routine &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isEnable, isEnable) ||
                other.isEnable == isEnable) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dayOfWeek, type, isEnable, detail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoutineCopyWith<_$_Routine> get copyWith =>
      __$$_RoutineCopyWithImpl<_$_Routine>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoutineToJson(
      this,
    );
  }
}

abstract class _Routine implements Routine {
  factory _Routine(
      {final String? dayOfWeek,
      final RoutineType? type,
      final bool? isEnable,
      final String? detail}) = _$_Routine;

  factory _Routine.fromJson(Map<String, dynamic> json) = _$_Routine.fromJson;

  @override
  String? get dayOfWeek;
  @override
  RoutineType? get type;
  @override
  bool? get isEnable;
  @override
  String? get detail;
  @override
  @JsonKey(ignore: true)
  _$$_RoutineCopyWith<_$_Routine> get copyWith =>
      throw _privateConstructorUsedError;
}
