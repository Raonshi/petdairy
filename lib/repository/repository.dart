import 'dart:convert';

import 'package:petdiary/config.dart';
import 'package:petdiary/data/pet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  Future<bool> createPet(Pet pet) async {
    try {
      final SharedPreferences localStorage = await SharedPreferences.getInstance();
      List<String> petList = localStorage.getStringList(LocalStorageKey.petList) ?? [];

      petList.add(jsonEncode(pet.toJson()));
      localStorage.setStringList(LocalStorageKey.petList, petList);
      return true;
    } catch (e) {
      lgr.e(e);
      return false;
    }
  }

  Future<List<Pet>> getAllPets() async {
    final SharedPreferences localStorage = await SharedPreferences.getInstance();
    List<String> strings = localStorage.getStringList(LocalStorageKey.petList) ?? [];

    return strings.map((e) {
      Map<String, dynamic> json = jsonDecode(e);
      return Pet.fromJson(json);
    }).toList();
  }

  Future<Pet> getPet(String uid) async {
    List<Pet> pets = await getAllPets();
    return pets.firstWhere((element) => element.uid == uid);
  }

  Future<bool> updatePet(Pet pet) async {
    try {
      final SharedPreferences localStorage = await SharedPreferences.getInstance();
      List<String> petList = localStorage.getStringList(LocalStorageKey.petList) ?? [];

      List<Pet> pets = petList.map((e) => Pet.fromJson(jsonDecode(e))).toList();

      final bool isContains = pets.any((e) => e.uid == pet.uid);

      lgr.d(isContains);

      if (isContains) {
        pets.removeWhere((e) => e.uid == pet.uid);
        pets.add(pet);

        petList = pets.map((e) => jsonEncode(e.toJson())).toList();
        localStorage.setStringList(LocalStorageKey.petList, petList);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      lgr.e(e);
      return false;
    }
  }

  Future<bool> deletePet(String uid) async {
    try {
      List<Pet> pets = await getAllPets();
      pets.removeWhere((e) => e.uid == uid);

      final SharedPreferences localStorage = await SharedPreferences.getInstance();
      List<String> petList = pets.map((e) => jsonEncode(e.toJson())).toList();
      localStorage.setStringList(LocalStorageKey.petList, petList);
      return true;
    } catch (e) {
      lgr.e(e);
      return false;
    }
  }
}
