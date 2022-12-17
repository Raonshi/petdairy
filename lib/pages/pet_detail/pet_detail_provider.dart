import 'package:flutter/material.dart';
import 'package:petdiary/data/pet_model.dart';
import 'package:petdiary/repositories/repository.dart';

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
}
