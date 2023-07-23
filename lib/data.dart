class Student {
  int id;
  String name;
  String sex;
  String homeTown;
  Type type;
  Block block;
  Student({required this.id,required this.name,required this.sex,required this.homeTown,required this.type,required this.block});
}

class Type {
  String name;
  Block block;
  List<Student> studentList;
  Type({required this.name, required this.studentList, required this.block});

  void removeStudent(Student student) {
    int index = studentList.indexWhere((element) => element.id == student.id);
    studentList.removeAt(index);
  }
}

class Block {
  String name;
  List<Type> typeList;
  Block({required this.name, required this.typeList});
}

List<Block> blockList = [
  Block(name: '10', typeList: []),
  Block(name: '11', typeList: []),
  Block(name: '12', typeList: []),
];

List<Type> dataTypeList = [
  Type(name: '10A', studentList: [], block: blockList[0]),
  Type(name: '10B', studentList: [], block: blockList[0]),
  Type(name: '10C', studentList: [], block: blockList[0]),
  Type(name: '11A', studentList: [], block: blockList[1]),
  Type(name: '11B', studentList: [], block: blockList[1]),
  Type(name: '11C', studentList: [], block: blockList[1]),
  Type(name: '12A', studentList: [], block: blockList[2]),
  Type(name: '12B', studentList: [], block: blockList[2]),
  Type(name: '12C', studentList: [], block: blockList[2]),
];

List<Student> dataStudentList = [
  Student(
    id: 0,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[0],
    block: blockList[0],
  ),
  Student(
    id: 1,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[0],
    block: blockList[0],
  ),
  Student(
    id: 2,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[1],
    block: blockList[0],
  ),
  Student(
    id: 3,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[1],
    block: blockList[0],
  ),
  Student(
    id: 4,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[2],
    block: blockList[0],
  ),
  Student(
    id: 5,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[2],
    block: blockList[0],
  ),
  Student(
    id: 6,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[3],
    block: blockList[1],
  ),
  Student(
    id: 7,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[3],
    block: blockList[1],
  ),
  Student(
    id: 8,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[4],
    block: blockList[1],
  ),
  Student(
    id: 9,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[4],
    block: blockList[1],
  ),
  Student(
    id: 10,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[5],
    block: blockList[1],
  ),
  Student(
    id: 11,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[5],
    block: blockList[1],
  ),
  Student(
    id: 12,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[6],
    block: blockList[2],
  ),
  Student(
    id: 13,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[6],
    block: blockList[2],
  ),
  Student(
    id: 14,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[7],
    block: blockList[2],
  ),
  Student(
    id: 15,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[7],
    block: blockList[2],
  ),
  Student(
    id: 16,
    name: 'Nguyễn Thị Mai',
    sex: 'Nữ',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[8],
    block: blockList[2],
  ),
  Student(
    id: 17,
    name: 'Nguyễn Văn Lang',
    sex: 'Nam',
    homeTown: 'Đội Cấn / Ba Đình / Hà Nội',
    type: dataTypeList[8],
    block: blockList[2],
  ),
];

void getStudent() {
  // for(Student student in dataStudentList) {
  //   debugPrint('${student.name} ${student.type.name}');
  // }
  Map<String, List<Student>> studentMap = {};
  for (Student student in dataStudentList) {
    studentMap.putIfAbsent(student.type.name, () => []);
    studentMap[student.type.name]!.add(student);
  }

  // for (MapEntry<String, List<Student>> entry in studentMap.entries) {
  //   debugPrint(entry.key);
  //   for (Student student in entry.value) {
  //     debugPrint(student.name);
  //   }
  //   debugPrint('_____________');
  // }

  for (Type type in dataTypeList) {
    type.studentList.clear();
    type.studentList.addAll(studentMap[type.name]!);
  }
}

void getType() {
  Map<String, List<Type>> typeMap = {};
  for (Type type in dataTypeList) {
    typeMap.putIfAbsent(type.block.name, () => []);
    typeMap[type.block.name]!.add(type);
  }

  for (Block block in blockList) {
    block.typeList.clear();
    block.typeList.addAll(typeMap[block.name]!);
  }
}