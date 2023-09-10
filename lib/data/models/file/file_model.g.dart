// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FileModelAdapter extends TypeAdapter<FileModel> {
  @override
  final int typeId = 8;

  @override
  FileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FileModel(
      defaultAvatar: fields[1] == null ? false : fields[1] as bool,
      file: fields[2] == null ? [] : (fields[2] as List).cast<String>(),
      id: fields[0] == null ? '' : fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FileModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.defaultAvatar)
      ..writeByte(2)
      ..write(obj.file)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileModel _$FileModelFromJson(Map<String, dynamic> json) => FileModel(
      defaultAvatar: json['defaultAvatar'] as bool? ?? false,
      file:
          (json['file'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$FileModelToJson(FileModel instance) => <String, dynamic>{
      'defaultAvatar': instance.defaultAvatar,
      'file': instance.file,
      'id': instance.id,
    };
