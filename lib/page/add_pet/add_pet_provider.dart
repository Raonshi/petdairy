import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petdiary/data/enums.dart';
import 'package:petdiary/data/pet_model.dart';
import 'package:petdiary/data/routine_model.dart';
import 'package:petdiary/repository/repository.dart';

class AddPetProvider extends ChangeNotifier {
  final Repository _repository = Repository();
  Pet newPet = Pet(
    sexType: SexType.unknown,
    species: AnimalType.unknown,
    growth: GrowthType.unknown,
  );

  Uint8List? cachedImage;

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
      cachedImage = await croppedFile.readAsBytes();
    }
    notifyListeners();
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
    // Initialize Routine
    List<String> dayOfWeeks = ['월', '화', '수', '목', '금', '토', '일'];
    newPet = newPet.copyWith(routines: List.generate(7, (index) => Routine(dayOfWeek: dayOfWeeks[index])));

    // Upload Image
    return await _repository.createPet(newPet, cachedImage);
  }
}
