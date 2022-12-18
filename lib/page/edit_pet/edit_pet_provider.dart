import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/data/pet_model.dart';
import 'package:petdiary/repository/repository.dart';
import 'package:uuid/uuid.dart';

class EditPetProvider extends ChangeNotifier {
  final Repository _repository = Repository();
  late Pet pet;

  bool isLoading = true;

  EditPetProvider(String id) {
    init(id);
  }

  void init(String id) async {
    pet = await _repository.getPet(id);
    isLoading = false;
    notifyListeners();
  }

  void onChangedName(String? value) {
    pet = pet.copyWith(name: value);
    notifyListeners();
  }

  void onClickSexualSelect(SexType type) {
    pet = pet.copyWith(sexType: type);
    notifyListeners();
  }

  void onClickGrosthSelect(GrowthType type) {
    pet = pet.copyWith(growth: type);
    notifyListeners();
  }

  void onClickSpeciesSelect(AnimalType type) {
    pet = pet.copyWith(species: type);
    notifyListeners();
  }

  void onChangedBirthday(DateTime? date) {
    pet = pet.copyWith(birthDay: date);
    notifyListeners();
  }

  void onChangedMemo(String? value) {
    pet = pet.copyWith(note: value);
    notifyListeners();
  }

  Future<bool> updatePet() async {
    return await _repository.updatePet(pet);
  }
}
