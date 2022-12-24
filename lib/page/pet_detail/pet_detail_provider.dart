import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:petdiary/data/pet_model.dart';
import 'package:petdiary/data/routine_model.dart';
import 'package:petdiary/repository/repository.dart';

class PetDetailProvider extends ChangeNotifier {
  final Repository _repository = Repository();

  Pet? pet;

  bool isUploaded = false;

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

  Future<void> onClickImageFromGallery() async {
    ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      await cropImage(file);
    }
    notifyListeners();
  }

  Future<void> onClickImageFromCamera() async {
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
      _repository.uploadFile(bytes, pet!.uid!);
    }
  }

  Future<bool> downloadImage() async {
    Directory tempDir = await getTemporaryDirectory();
    final bool isDirExist = await tempDir.exists();
    if (!isDirExist) {
      await tempDir.create();
    }
    File file =
        await File('${tempDir.path}/${pet?.name ?? 'pet'}_${DateFormat('yyyyMMddhhmmss').format(DateTime.now())}.jpeg')
            .create();

    Uint8List? data = await _repository.downloadFile(pet!.uid!);
    if (data == null) {
      return false;
    } else {
      file = await file.writeAsBytes(data);
      return await GallerySaver.saveImage(file.path, toDcim: true) ?? false;
    }
  }

  void updatePet() async {
    isUploaded = await _repository.updatePet(pet!);
    notifyListeners();
  }

  void changeNotiStatus(bool value) {
    pet = pet!.copyWith(isNotiEnabled: value);
    updatePet();
  }

  void updateRoutine(Routine routine, int index) {
    List<Routine> newRoutines = pet!.routines.toList();
    newRoutines.replaceRange(index, index + 1, [routine]);
    pet = pet!.copyWith(routines: newRoutines);

    updatePet();

    notifyListeners();
  }
}
