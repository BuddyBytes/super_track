import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:super_track/constants/hive_constants.dart';
import 'package:super_track/db/hive%20model/profilesDb.dart';

class SuperTrackProfilesHiveProvider extends ChangeNotifier {
  // get instance of the profiles database
  final _profileHive = Hive.box<SuperTrackProfilesLocalDb>(hiveBoxProfiles);

  get hiveProfiles => _profileHive;

  void addNewProfileToHiveDatabase({
    required String profileName,
    required dynamic profileBalance,
  }) {
    _profileHive.put(
      profileName,
      SuperTrackProfilesLocalDb(
        username: profileName,
        balance: profileBalance,
      ),
    );
    notifyListeners();
  }

  void clearDatabase() {
    hiveProfiles.clear();
    notifyListeners();
  }

  void removeFromDatabase({required int index}) {
    hiveProfiles.deleteAt(index);
    notifyListeners();
  }

  void updateProfile({
    required dynamic index,
    required dynamic newProfileName,
    required dynamic newProfileBalance,
  }) {
    final SuperTrackProfilesLocalDb object =
        _profileHive.getAt(index) as SuperTrackProfilesLocalDb;
    object.username = newProfileName;
    object.balance = newProfileBalance;

    _profileHive.putAt(index, object);
    notifyListeners();
  }
}
