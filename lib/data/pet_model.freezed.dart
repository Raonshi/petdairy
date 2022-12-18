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
  String? get uid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  DateTime? get birthDay => throw _privateConstructorUsedError;
  List<int>? get image => throw _privateConstructorUsedError;
  SexType? get sexType => throw _privateConstructorUsedError;
  GrowthType? get growth => throw _privateConstructorUsedError;
  AnimalType? get species => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  List<Routine>? get routines => throw _privateConstructorUsedError;
  bool? get isNotiEnabled => throw _privateConstructorUsedError;

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
      {String? uid,
      String? name,
      DateTime? birthDay,
      List<int>? image,
      SexType? sexType,
      GrowthType? growth,
      AnimalType? species,
      String? note,
      List<Routine>? routines,
      bool? isNotiEnabled});
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
    Object? uid = freezed,
    Object? name = freezed,
    Object? birthDay = freezed,
    Object? image = freezed,
    Object? sexType = freezed,
    Object? growth = freezed,
    Object? species = freezed,
    Object? note = freezed,
    Object? routines = freezed,
    Object? isNotiEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      sexType: freezed == sexType
          ? _value.sexType
          : sexType // ignore: cast_nullable_to_non_nullable
              as SexType?,
      growth: freezed == growth
          ? _value.growth
          : growth // ignore: cast_nullable_to_non_nullable
              as GrowthType?,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as AnimalType?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      routines: freezed == routines
          ? _value.routines
          : routines // ignore: cast_nullable_to_non_nullable
              as List<Routine>?,
      isNotiEnabled: freezed == isNotiEnabled
          ? _value.isNotiEnabled
          : isNotiEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      {String? uid,
      String? name,
      DateTime? birthDay,
      List<int>? image,
      SexType? sexType,
      GrowthType? growth,
      AnimalType? species,
      String? note,
      List<Routine>? routines,
      bool? isNotiEnabled});
}

/// @nodoc
class __$$_PetCopyWithImpl<$Res> extends _$PetCopyWithImpl<$Res, _$_Pet>
    implements _$$_PetCopyWith<$Res> {
  __$$_PetCopyWithImpl(_$_Pet _value, $Res Function(_$_Pet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? birthDay = freezed,
    Object? image = freezed,
    Object? sexType = freezed,
    Object? growth = freezed,
    Object? species = freezed,
    Object? note = freezed,
    Object? routines = freezed,
    Object? isNotiEnabled = freezed,
  }) {
    return _then(_$_Pet(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      image: freezed == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      sexType: freezed == sexType
          ? _value.sexType
          : sexType // ignore: cast_nullable_to_non_nullable
              as SexType?,
      growth: freezed == growth
          ? _value.growth
          : growth // ignore: cast_nullable_to_non_nullable
              as GrowthType?,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as AnimalType?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      routines: freezed == routines
          ? _value._routines
          : routines // ignore: cast_nullable_to_non_nullable
              as List<Routine>?,
      isNotiEnabled: freezed == isNotiEnabled
          ? _value.isNotiEnabled
          : isNotiEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Pet with DiagnosticableTreeMixin implements _Pet {
  _$_Pet(
      {this.uid,
      this.name,
      this.birthDay,
      final List<int>? image,
      this.sexType,
      this.growth,
      this.species,
      this.note,
      final List<Routine>? routines,
      this.isNotiEnabled})
      : _image = image,
        _routines = routines;

  factory _$_Pet.fromJson(Map<String, dynamic> json) => _$$_PetFromJson(json);

  @override
  final String? uid;
  @override
  final String? name;
  @override
  final DateTime? birthDay;
  final List<int>? _image;
  @override
  List<int>? get image {
    final value = _image;
    if (value == null) return null;
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final SexType? sexType;
  @override
  final GrowthType? growth;
  @override
  final AnimalType? species;
  @override
  final String? note;
  final List<Routine>? _routines;
  @override
  List<Routine>? get routines {
    final value = _routines;
    if (value == null) return null;
    if (_routines is EqualUnmodifiableListView) return _routines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isNotiEnabled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Pet(uid: $uid, name: $name, birthDay: $birthDay, image: $image, sexType: $sexType, growth: $growth, species: $species, note: $note, routines: $routines, isNotiEnabled: $isNotiEnabled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Pet'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('birthDay', birthDay))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('sexType', sexType))
      ..add(DiagnosticsProperty('growth', growth))
      ..add(DiagnosticsProperty('species', species))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('routines', routines))
      ..add(DiagnosticsProperty('isNotiEnabled', isNotiEnabled));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pet &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.sexType, sexType) || other.sexType == sexType) &&
            (identical(other.growth, growth) || other.growth == growth) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality().equals(other._routines, _routines) &&
            (identical(other.isNotiEnabled, isNotiEnabled) ||
                other.isNotiEnabled == isNotiEnabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      name,
      birthDay,
      const DeepCollectionEquality().hash(_image),
      sexType,
      growth,
      species,
      note,
      const DeepCollectionEquality().hash(_routines),
      isNotiEnabled);

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
      {final String? uid,
      final String? name,
      final DateTime? birthDay,
      final List<int>? image,
      final SexType? sexType,
      final GrowthType? growth,
      final AnimalType? species,
      final String? note,
      final List<Routine>? routines,
      final bool? isNotiEnabled}) = _$_Pet;

  factory _Pet.fromJson(Map<String, dynamic> json) = _$_Pet.fromJson;

  @override
  String? get uid;
  @override
  String? get name;
  @override
  DateTime? get birthDay;
  @override
  List<int>? get image;
  @override
  SexType? get sexType;
  @override
  GrowthType? get growth;
  @override
  AnimalType? get species;
  @override
  String? get note;
  @override
  List<Routine>? get routines;
  @override
  bool? get isNotiEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_PetCopyWith<_$_Pet> get copyWith => throw _privateConstructorUsedError;
}
