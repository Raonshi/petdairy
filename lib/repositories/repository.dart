import 'dart:convert';

import 'package:petdiary/config.dart';
import 'package:petdiary/data/pet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  Future<bool> createPet(Pet pet) async {
    final SharedPreferences localStorage = await SharedPreferences.getInstance();
    List<String> petLists = localStorage.getStringList(LocalStorageKey.petList) ?? [];

    petLists.add(pet.toJson().toString());
    localStorage.setStringList(LocalStorageKey.petList, petLists);
    return true;
  }

  Future<List<Pet>> getAllPets() async {
    final SharedPreferences localStorage = await SharedPreferences.getInstance();
    List<String> strings = localStorage.getStringList(LocalStorageKey.petList) ?? [];

    return strings.map((e) {
      Map<String, dynamic> json = jsonDecode(e);
      return Pet.fromJson(json);
    }).toList();
  }
}
