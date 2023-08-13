import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:super_track/constants/hive_constants.dart';
import 'package:super_track/db/hive%20model/profilesDb.dart';
import 'package:intl/intl.dart';

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

  String profileDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }



  // track and register the expanses
}
