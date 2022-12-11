import 'package:hive/hive.dart';
import 'package:jams/src/persistence/hive_constants.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveConstants.HIVE_TYPE_BOX, adapterName: 'BookAdapter')
class BookVO {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int chapterCount;

  BookVO({required this.name, required this.chapterCount});

  factory BookVO.fromJson(Map<String, dynamic> json) => _$BookVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookVOToJson(this);
}
