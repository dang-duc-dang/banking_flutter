import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_model.g.dart';

@HiveType(typeId: 8)
@JsonSerializable(explicitToJson: true)
class FileModel extends HiveObject {
  @HiveField(1, defaultValue: false)
  @JsonKey(defaultValue: false)
  bool defaultAvatar;

  @HiveField(2, defaultValue: [])
  @JsonKey(defaultValue: [])
  List<String> file;

  @HiveField(0, defaultValue: '')
  @JsonKey(defaultValue: '')
  String id;

  String getImageUrl() {
    return '${ApiClient.apiHostReal}/static/${file[0]}';
  }

  FileModel({this.defaultAvatar = false, this.file = const [], this.id = ''});

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileModelToJson(this);
}
