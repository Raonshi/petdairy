import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petdiary/data/enums.dart';

part 'pet_model.freezed.dart';
part 'pet_model.g.dart';

@freezed
class Pet with _$Pet {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory Pet({
    required String name,
    DateTime? birthDay,
    bool? isMale,
    GrowthType? growth,
    AnimalType? type,
    String? note,
  }) = _Pet;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
}
