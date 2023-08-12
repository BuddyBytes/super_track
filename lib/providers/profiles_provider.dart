import 'package:flutter/material.dart';

class NewProfilesProvider extends ChangeNotifier {
  Map<String, dynamic> _profiles = {
    'Guest': '500',
  };

  Map<String, dynamic> get profiles => _profiles;
  void addNewPrfile({
    required String profileName,
    required dynamic profileBalance,
  }) {
    _profiles.addAll({
      profileName: profileBalance,
    });
    notifyListeners();
  }

  void removeProfile({required dynamic index}) {
    _profiles.remove(index);
    notifyListeners();
  }

  void updateProfile({
    required dynamic key,
    required dynamic mapValue,
  }) {
    _profiles.update(
      key,
      (value) => mapValue,
      ifAbsent: () => mapValue,
    );
    notifyListeners();
  }
}
