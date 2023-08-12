import 'package:hive/hive.dart';

part 'profilesDb.g.dart';

@HiveType(typeId: 0)
class SuperTrackProfilesLocalDb extends HiveObject {
  @HiveField(0)
  late String username;

  @HiveField(1)
  late dynamic balance;

  SuperTrackProfilesLocalDb({
    required this.username,
    required this.balance,
  });
}

