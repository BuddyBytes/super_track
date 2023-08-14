// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expanses_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SuperTrackExpansesDatabaseAdapter
    extends TypeAdapter<SuperTrackExpansesDatabase> {
  @override
  final int typeId = 1;

  @override
  SuperTrackExpansesDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SuperTrackExpansesDatabase(
      description: fields[0] as String,
      outcomes: fields[1] as dynamic,
      outcomesDate: fields[2] as String,
      actualBalance: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, SuperTrackExpansesDatabase obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.outcomes)
      ..writeByte(2)
      ..write(obj.outcomesDate)
      ..writeByte(3)
      ..write(obj.actualBalance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuperTrackExpansesDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
