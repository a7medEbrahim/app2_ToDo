import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/Models/userModel.dart';
import 'package:todo/shared/network/firebase/firebaseManager.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = 'en';
  String language = 'English';
  UserModel? userModel;
  User? firebaseUser;

  MyProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }

  initUser() async {
    firebaseUser = FirebaseAuth.instance.currentUser;
    userModel = await FirebaseManager.readUser(firebaseUser!.uid);
    notifyListeners();
  }

  ThemeMode mode = ThemeMode.light;

  void changeMode(ThemeMode themeMode) {
    mode = themeMode;
    notifyListeners();
  }

  void changeLanguage(String langCode) {
    languageCode = langCode;
    if (languageCode == "en") {
      language = "English";
    } else if (languageCode == "ar") {
      language = "عربي";
    }
    notifyListeners();
  }
}
