import 'package:flutter/material.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/data/pet_model.dart';
import 'package:petdiary/repositories/repository.dart';
import 'package:uuid/uuid.dart';

class AddPetProvider extends ChangeNotifier {
  final Repository _repository = Repository();
  Pet newPet = Pet(
    sexType: SexType.unknown,
    species: AnimalType.unknown,
    growth: GrowthType.unknown,
  );

  void onChangedName(String? value) {
    newPet = newPet.copyWith(name: value);
    notifyListeners();
  }

  void onClickSexualSelect(SexType type) {
    newPet = newPet.copyWith(sexType: type);
    notifyListeners();
  }

  void onClickGrosthSelect(GrowthType type) {
    newPet = newPet.copyWith(growth: type);
    notifyListeners();
  }

  void onClickSpeciesSelect(AnimalType type) {
    newPet = newPet.copyWith(species: type);
    notifyListeners();
  }

  void onChangedBirthday(DateTime? date) {
    newPet = newPet.copyWith(birthDay: date);
    notifyListeners();
  }

  void onChangedMemo(String? value) {
    newPet = newPet.copyWith(note: value);
    notifyListeners();
  }

  Future<bool> createPet() async {
    final String uid = const Uuid().v1();
    newPet = newPet.copyWith(uid: uid);
    return await _repository.createPet(newPet);
  }
}
