import 'package:flutter/material.dart';
import 'package:petdiary/data/pet_model.dart';
import 'package:petdiary/repositories/repository.dart';

class RootProvider extends ChangeNotifier {
  final Repository _repository = Repository();

  List<Pet> pets = [];

  RootProvider() {
    init();
  }

  void init() async {
    pets = await _repository.getAllPets();
    notifyListeners();
  }
}
