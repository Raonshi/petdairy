import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/data/pet_model.dart';
import 'package:petdiary/repository/repository.dart';
import 'package:uuid/uuid.dart';

class AddPetProvider extends ChangeNotifier {
  final Repository _repository = Repository();
  Pet newPet = Pet(
    sexType: SexType.unknown,
    species: AnimalType.unknown,
    growth: GrowthType.unknown,
  );

  void onClickImageFromGallery() async {
    ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      await cropImage(file);
    }
    notifyListeners();
  }

  void onClickImageFromCamera() async {
    ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      await cropImage(file);
    }
    notifyListeners();
  }

  Future<void> cropImage(XFile file) async {
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
          hideBottomControls: true,
        ),
      ],
    );

    if (croppedFile != null) {
      final Uint8List bytes = await croppedFile.readAsBytes();
      newPet = newPet.copyWith(image: bytes);
    }
  }

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
