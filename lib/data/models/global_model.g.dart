// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GlobalModelAdapter extends TypeAdapter<GlobalModel> {
  @override
  final int typeId = 0;

  @override
  GlobalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GlobalModel(
      storeIP: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GlobalModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.storeIP);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
