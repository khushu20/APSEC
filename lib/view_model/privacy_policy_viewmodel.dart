import 'package:flutter/material.dart';

class PrivacyPolicyViewModel with ChangeNotifier {
  bool isLoading = false;
  get getIsLoadingStatus => isLoading;
  setIsLoadingStatus(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
