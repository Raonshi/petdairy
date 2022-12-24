import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petdiary/data/enums.dart';

part 'routine_model.freezed.dart';
part 'routine_model.g.dart';

@freezed
class Routine with _$Routine {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory Routine({
    required String dayOfWeek,
    @Default(RoutineType.etc) RoutineType type,
    @Default(false) bool isEnable,
    String? detail,
  }) = _Routine;

  factory Routine.fromJson(Map<String, dynamic> json) => _$RoutineFromJson(json);
}
