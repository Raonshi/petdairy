import 'package:flutter/material.dart';
import 'package:petdiary/data/pet_model.dart';
import 'package:petdiary/repository/repository.dart';

class PetDetailProvider extends ChangeNotifier {
  final Repository _repository = Repository();

  Pet? pet;

  PetDetailProvider(String id) {
    init(id);
  }

  void init(String id) async {
    pet = await _repository.getPet(id);
    notifyListeners();
  }

  Future<bool> onClickDelete() async {
    late final bool result;
    if (pet?.uid != null) {
      result = await _repository.deletePet(pet!.uid!);
    } else {
      result = false;
    }
    notifyListeners();
    return result;
  }
}
