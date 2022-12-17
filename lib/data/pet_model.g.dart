// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pet _$$_PetFromJson(Map<String, dynamic> json) => _$_Pet(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      birthDay: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      imageBytes: json['imageBytes'] as String?,
      sexType: $enumDecodeNullable(_$SexTypeEnumMap, json['sexType']),
      growth: $enumDecodeNullable(_$GrowthTypeEnumMap, json['growth']),
      species: $enumDecodeNullable(_$AnimalTypeEnumMap, json['species']),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_PetToJson(_$_Pet instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'birthDay': instance.birthDay?.toIso8601String(),
      'imageBytes': instance.imageBytes,
      'sexType': _$SexTypeEnumMap[instance.sexType],
      'growth': _$GrowthTypeEnumMap[instance.growth],
      'species': _$AnimalTypeEnumMap[instance.species],
      'note': instance.note,
    };

const _$SexTypeEnumMap = {
  SexType.male: 'male',
  SexType.female: 'female',
  SexType.unknown: 'unknown',
};

const _$GrowthTypeEnumMap = {
  GrowthType.baby: 'baby',
  GrowthType.juvenile: 'juvenile',
  GrowthType.adult: 'adult',
  GrowthType.unknown: 'unknown',
};

const _$AnimalTypeEnumMap = {
  AnimalType.mammal: 'mammal',
  AnimalType.fish: 'fish',
  AnimalType.bird: 'bird',
  AnimalType.reptile: 'reptile',
  AnimalType.amphibians: 'amphibians',
  AnimalType.insect: 'insect',
  AnimalType.unknown: 'unknown',
};
