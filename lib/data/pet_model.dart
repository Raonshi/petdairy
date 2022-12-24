import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/data/routine_model.dart';

part 'pet_model.freezed.dart';
part 'pet_model.g.dart';

@freezed
class Pet with _$Pet {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory Pet({
    String? uid,
    String? name,
    DateTime? birthDay,
    String? imageUrl,
    String? note,
    @Default(SexType.unknown) SexType? sexType,
    @Default(GrowthType.unknown) GrowthType? growth,
    @Default(AnimalType.unknown) AnimalType? species,
    @Default([]) List<Routine> routines,
    @Default(false) bool? isNotiEnabled,
    String? owner,
  }) = _Pet;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
}
