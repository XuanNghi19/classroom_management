// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentAdapter extends TypeAdapter<Student> {
  @override
  final int typeId = 0;

  @override
  Student read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Student(
      id: fields[0] as int,
      imageFile: fields[1] as Uint8List?,
      name: fields[2] as String,
      sex: fields[3] as String,
      homeTown: fields[4] as String,
      group: fields[5] as Group,
      block: fields[6] as Block,
    );
  }

  @override
  void write(BinaryWriter writer, Student obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageFile)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.sex)
      ..writeByte(4)
      ..write(obj.homeTown)
      ..writeByte(5)
      ..write(obj.group)
      ..writeByte(6)
      ..write(obj.block);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
