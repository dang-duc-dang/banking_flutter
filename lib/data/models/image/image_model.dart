import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../file/file_model.dart';

part 'image_model.g.dart';

@HiveType(typeId: 7)
@JsonSerializable(explicitToJson: true)
class ImageModel extends HiveObject {
  @HiveField(1, defaultValue: null)
  @JsonKey(defaultValue: null)
  FileModel? file;

  ImageModel({this.file});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
