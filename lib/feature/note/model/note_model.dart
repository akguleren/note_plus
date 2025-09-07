import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:note_plus/app/core/network/model/i_network_model.dart';

part 'note_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class NoteModel extends HiveObject implements INetworkModel<NoteModel> {
  NoteModel({this.id, required this.title, required this.content, DateTime? createdAt, DateTime? updatedAt})
    : createdAt = createdAt ?? DateTime.now(),
      updatedAt = updatedAt ?? createdAt ?? DateTime.now();

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final DateTime createdAt;
  @HiveField(4)
  final DateTime updatedAt;

  @override
  NoteModel fromJson(Map<String, dynamic> json) => _$NoteModelFromJson(json);

  factory NoteModel.fromJson(Map<String, dynamic> json) => _$NoteModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NoteModelToJson(this);

  NoteModel copyWith({String? id, String? title, String? content, DateTime? createdAt, DateTime? updatedAt}) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  NoteModel touch() => copyWith(updatedAt: DateTime.now());
}
