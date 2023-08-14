import 'package:hive/hive.dart';

part 'expanses_db.g.dart';

@HiveType(typeId: 1)
class SuperTrackExpansesDatabase extends HiveObject {
  @HiveField(0)
  String description;

  @HiveField(1)
  final outcomes;

  @HiveField(2)
  String outcomesDate;

  @HiveField(3)
  final actualBalance;

  @HiveField(4)
  SuperTrackExpansesDatabase({
    required this.description,
    required this.outcomes,
    required this.outcomesDate,
    required this.actualBalance,
  });
}
