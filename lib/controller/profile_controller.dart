import 'dart:io';

import 'package:bayouni_coffee/controller/database.dart';
import 'package:bayouni_coffee/utils/shared_prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final userName = sharedPrefs.userName.obs;
  final phoneNo = sharedPrefs.phoneNo.obs;
  final cityName = sharedPrefs.cityName.obs;
  final districtName = sharedPrefs.districtName.obs;
  final ImagePicker _picker = ImagePicker();
  final imageURL = sharedPrefs.imageURL.obs;
  final isUploading = false.obs;
  Future<void> pickImage() async {
    File pickedImage;
    try {
      final XFile? imageFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 30,
      );
      isUploading.value = true;
      pickedImage = File(imageFile!.path);
    } catch (e) {
      print('error in image picking $e');
      return;
    }
    final ref = FirebaseStorage.instance
        .ref()
        .child('images')
        .child(FirebaseAuth.instance.currentUser!.uid + '.jpg');
    await ref.putFile(pickedImage);
    sharedPrefs.imageURL = await ref.getDownloadURL();
    imageURL.value = sharedPrefs.imageURL;
    isUploading.value = false;
    await DBHelper.updateImageURL(sharedPrefs.imageURL);
  }

  void initUserDetails() {
    userName.value = sharedPrefs.userName;
    phoneNo.value = sharedPrefs.phoneNo;
    cityName.value = sharedPrefs.cityName;
    districtName.value = sharedPrefs.districtName;
    imageURL.value = sharedPrefs.imageURL;
  }

  void updateName(String newName) {
    sharedPrefs.userName = newName;
    userName.value = sharedPrefs.userName;
    DBHelper.updateUserName(sharedPrefs.userName);
  }

  void updatePhoneNo(String newPhoneNo) {
    sharedPrefs.phoneNo = newPhoneNo;
    phoneNo.value = sharedPrefs.phoneNo;
    DBHelper.updatePhoneNo(sharedPrefs.phoneNo);
  }

  void updateCityName(String newCityName) {
    sharedPrefs.cityName = newCityName;
    cityName.value = sharedPrefs.cityName;
    DBHelper.updatePhoneNo(sharedPrefs.phoneNo);
  }

  void updateDistrictName(String newDistrictName) {
    sharedPrefs.districtName = newDistrictName;
    districtName.value = sharedPrefs.districtName;
    DBHelper.updatePhoneNo(sharedPrefs.phoneNo);
  }
}
