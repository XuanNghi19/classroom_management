import 'package:hive_flutter/hive_flutter.dart';
import 'block.dart';

part 'group.g.dart';

@HiveType(typeId: 1)
class Group {
  @HiveField(0)
  String name;

  @HiveField(1)
  Block block;

  Group({required this.name, required this.block});
}

List<Group> dataGroup = [
  Group(name: '10A', block: dataBlock[0]),
  Group(name: '10B', block: dataBlock[0]),
  Group(name: '10C', block: dataBlock[0]),
  Group(name: '11A', block: dataBlock[1]),
  Group(name: '11B', block: dataBlock[1]),
  Group(name: '11C', block: dataBlock[1]),
  Group(name: '12A', block: dataBlock[2]),
  Group(name: '12B', block: dataBlock[2]),
  Group(name: '12C', block: dataBlock[2]),
];