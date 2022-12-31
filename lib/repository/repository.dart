import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:petdiary/config.dart';
import 'package:petdiary/data/pet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  final CollectionReference<Map<String, dynamic>> petsRef = FirebaseFirestore.instance.collection('pets');

  Future<bool> createPet(Pet pet, Uint8List? cachedImage) async {
    final DocumentReference docRef = petsRef.doc();

    String? imageUrl;
    if (cachedImage != null) {
      imageUrl = await uploadFile(cachedImage, docRef.id);
    }

    final bool result = await docRef
        .set(pet.copyWith(uid: docRef.id, owner: FirebaseAuth.instance.currentUser!.uid, imageUrl: imageUrl).toJson())
        .then((_) async {
      lgr.d('createPet() : Success!');
      return true;
    }, onError: (err) {
      lgr.e('createPet() : Failed!', err);
      return false;
    });

    return result;
  }

  Future<List<Pet>> getAllPets() async {
    return await petsRef.get().then((snapshot) {
      return snapshot.docs.map((e) => Pet.fromJson(e.data())).toList();
    }, onError: (err) {
      lgr.e('getAllPets() : Failed!', err);
      return [];
    });
  }

  Future<Pet> getPet(String uid) async {
    final DocumentReference<Map<String, dynamic>> docRef = petsRef.doc(uid);
    return await docRef.get().then((snapshot) {
      final Map<String, dynamic> json = snapshot.data()!;
      return Pet.fromJson(json);
    }, onError: (err) {
      lgr.e('getPet() : Failed!', err);
      return Pet();
    });
  }

  Future<bool> updatePet(Pet pet) async {
    final DocumentReference<Map<String, dynamic>> docRef = petsRef.doc(pet.uid);

    final bool result = await docRef.set(pet.toJson()).then((_) {
      lgr.d('updatePet() : Success!');
      return true;
    }, onError: (err) {
      lgr.e('updatePet() : Failed!', err);
      return false;
    });

    return result;
  }

  Future<bool> deletePet(String uid) async {
    final DocumentReference docRef = petsRef.doc(uid);

    final bool result = await docRef.delete().then((_) {
      lgr.d('updatePet() : Success!');
      return true;
    }, onError: (err) {
      lgr.e('updatePet() : Failed!', err);
      return false;
    });

    return result;
  }

  Future<String?> uploadFile(Uint8List cachedFile, String uid) async {
    Reference ref = FirebaseStorage.instance.ref('/images/${FirebaseAuth.instance.currentUser!.uid}/$uid.png');
    String? url = await ref.putData(cachedFile).then((p0) async {
      if (p0.state == TaskState.success) {
        return await ref.getDownloadURL();
      }
      return null;
    });

    return url;
  }

  Future<Uint8List?> downloadFile(String uid) async {
    Reference ref = FirebaseStorage.instance.ref('/images/${FirebaseAuth.instance.currentUser!.uid}/$uid.png');
    Uint8List? data = await ref.getData();
    return data;
  }

  Future<void> enableNotification() async {
    String token = await getToken();
    final FirebaseFunctions functions = FirebaseFunctions.instance;
    await functions.httpsCallable('enableNotification').call(token);
  }

  Future<void> setToken(String token) async {
    final SharedPreferences localStorage = await SharedPreferences.getInstance();

    localStorage.setString(LocalStorageKey.fcmToken, token);
  }

  Future<String> getToken() async {
    final SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString(LocalStorageKey.fcmToken);

    return token ?? '';
  }
}
