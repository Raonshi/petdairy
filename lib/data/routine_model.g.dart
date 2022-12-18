// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Routine _$$_RoutineFromJson(Map<String, dynamic> json) => _$_Routine(
      dayOfWeek: json['dayOfWeek'] as String?,
      type: $enumDecodeNullable(_$RoutineTypeEnumMap, json['type']),
      isEnable: json['isEnable'] as bool?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$$_RoutineToJson(_$_Routine instance) =>
    <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'type': _$RoutineTypeEnumMap[instance.type],
      'isEnable': instance.isEnable,
      'detail': instance.detail,
    };

const _$RoutineTypeEnumMap = {
  RoutineType.feed: 'feed',
  RoutineType.cleaning: 'cleaning',
  RoutineType.washing: 'washing',
  RoutineType.health: 'health',
  RoutineType.play: 'play',
  RoutineType.etc: 'etc',
};
