import 'package:hive_flutter/hive_flutter.dart';

part 'block.g.dart';

@HiveType(typeId: 2)
class Block {
  @HiveField(0)
  String name;

  Block({required this.name});
}

List<Block> dataBlock = [
  Block(name: '10'),
  Block(name: '11'),
  Block(name: '12'),
];