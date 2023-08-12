// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profilesDb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SuperTrackProfilesLocalDbAdapter
    extends TypeAdapter<SuperTrackProfilesLocalDb> {
  @override
  final int typeId = 0;

  @override
  SuperTrackProfilesLocalDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SuperTrackProfilesLocalDb(
      username: fields[0] as String,
      balance: fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, SuperTrackProfilesLocalDb obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.balance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuperTrackProfilesLocalDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
