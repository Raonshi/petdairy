// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pet _$$_PetFromJson(Map<String, dynamic> json) => _$_Pet(
      name: json['name'] as String,
      birthDay: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      isMale: json['isMale'] as bool?,
      growth: $enumDecodeNullable(_$GrowthTypeEnumMap, json['growth']),
      type: $enumDecodeNullable(_$AnimalTypeEnumMap, json['type']),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_PetToJson(_$_Pet instance) => <String, dynamic>{
      'name': instance.name,
      'birthDay': instance.birthDay?.toIso8601String(),
      'isMale': instance.isMale,
      'growth': _$GrowthTypeEnumMap[instance.growth],
      'type': _$AnimalTypeEnumMap[instance.type],
      'note': instance.note,
    };

const _$GrowthTypeEnumMap = {
  GrowthType.baby: 'baby',
  GrowthType.juvenile: 'juvenile',
  GrowthType.adult: 'adult',
};

const _$AnimalTypeEnumMap = {
  AnimalType.mammal: 'mammal',
  AnimalType.fish: 'fish',
  AnimalType.bird: 'bird',
  AnimalType.reptile: 'reptile',
  AnimalType.insect: 'insect',
};
