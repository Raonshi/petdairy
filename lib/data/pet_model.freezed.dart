// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pet _$PetFromJson(Map<String, dynamic> json) {
  return _Pet.fromJson(json);
}

/// @nodoc
mixin _$Pet {
  String get name => throw _privateConstructorUsedError;
  DateTime? get birthDay => throw _privateConstructorUsedError;
  bool? get isMale => throw _privateConstructorUsedError;
  GrowthType? get growth => throw _privateConstructorUsedError;
  AnimalType? get type => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetCopyWith<Pet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetCopyWith<$Res> {
  factory $PetCopyWith(Pet value, $Res Function(Pet) then) =
      _$PetCopyWithImpl<$Res, Pet>;
  @useResult
  $Res call(
      {String name,
      DateTime? birthDay,
      bool? isMale,
      GrowthType? growth,
      AnimalType? type,
      String? note});
}

/// @nodoc
class _$PetCopyWithImpl<$Res, $Val extends Pet> implements $PetCopyWith<$Res> {
  _$PetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birthDay = freezed,
    Object? isMale = freezed,
    Object? growth = freezed,
    Object? type = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isMale: freezed == isMale
          ? _value.isMale
          : isMale // ignore: cast_nullable_to_non_nullable
              as bool?,
      growth: freezed == growth
          ? _value.growth
          : growth // ignore: cast_nullable_to_non_nullable
              as GrowthType?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AnimalType?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PetCopyWith<$Res> implements $PetCopyWith<$Res> {
  factory _$$_PetCopyWith(_$_Pet value, $Res Function(_$_Pet) then) =
      __$$_PetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      DateTime? birthDay,
      bool? isMale,
      GrowthType? growth,
      AnimalType? type,
      String? note});
}

/// @nodoc
class __$$_PetCopyWithImpl<$Res> extends _$PetCopyWithImpl<$Res, _$_Pet>
    implements _$$_PetCopyWith<$Res> {
  __$$_PetCopyWithImpl(_$_Pet _value, $Res Function(_$_Pet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birthDay = freezed,
    Object? isMale = freezed,
    Object? growth = freezed,
    Object? type = freezed,
    Object? note = freezed,
  }) {
    return _then(_$_Pet(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isMale: freezed == isMale
          ? _value.isMale
          : isMale // ignore: cast_nullable_to_non_nullable
              as bool?,
      growth: freezed == growth
          ? _value.growth
          : growth // ignore: cast_nullable_to_non_nullable
              as GrowthType?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AnimalType?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Pet implements _Pet {
  _$_Pet(
      {required this.name,
      this.birthDay,
      this.isMale,
      this.growth,
      this.type,
      this.note});

  factory _$_Pet.fromJson(Map<String, dynamic> json) => _$$_PetFromJson(json);

  @override
  final String name;
  @override
  final DateTime? birthDay;
  @override
  final bool? isMale;
  @override
  final GrowthType? growth;
  @override
  final AnimalType? type;
  @override
  final String? note;

  @override
  String toString() {
    return 'Pet(name: $name, birthDay: $birthDay, isMale: $isMale, growth: $growth, type: $type, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pet &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            (identical(other.isMale, isMale) || other.isMale == isMale) &&
            (identical(other.growth, growth) || other.growth == growth) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, birthDay, isMale, growth, type, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PetCopyWith<_$_Pet> get copyWith =>
      __$$_PetCopyWithImpl<_$_Pet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PetToJson(
      this,
    );
  }
}

abstract class _Pet implements Pet {
  factory _Pet(
      {required final String name,
      final DateTime? birthDay,
      final bool? isMale,
      final GrowthType? growth,
      final AnimalType? type,
      final String? note}) = _$_Pet;

  factory _Pet.fromJson(Map<String, dynamic> json) = _$_Pet.fromJson;

  @override
  String get name;
  @override
  DateTime? get birthDay;
  @override
  bool? get isMale;
  @override
  GrowthType? get growth;
  @override
  AnimalType? get type;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$_PetCopyWith<_$_Pet> get copyWith => throw _privateConstructorUsedError;
}
