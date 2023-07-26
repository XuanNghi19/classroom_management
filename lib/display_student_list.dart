import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'display_data.dart';
import 'modulus.dart';
import 'display_student_detail.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DisplayStudentList extends StatefulWidget {
  const DisplayStudentList({super.key, required this.displayGroupDraft});
  final DisplayGroup displayGroupDraft;
  @override
  State<DisplayStudentList> createState() => _DisplayStudentListState();
}

class _DisplayStudentListState extends State<DisplayStudentList> {

  final boxDefault = Hive.box('boxDefault');

  @override
  Widget build(BuildContext context) {
  
    Uint8List defaultImage = boxDefault.get('imageProfileDefaut');
    final displayGroupDraft = widget.displayGroupDraft;
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        toolbarHeight: 75,
        centerTitle: true,
        title: const Text(
          'Danh sách học sinh',
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Danh sách học sinh lớp ${displayGroupDraft.name}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Divider(),
            SingleChildScrollView(
              child: Table(
                border: TableBorder.all(
                    color: const Color.fromARGB(221, 255, 255, 255), width: 2),
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(32),
                  1: FixedColumnWidth(60),
                  2: FlexColumnWidth(),
                  3: FixedColumnWidth(64),
                  4: FixedColumnWidth(64),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                    ),
                    children: const [
                      SizedBox(
                        height: 50,
                        child: Center(
                            child: Text(
                          'STT',
                          style: TextStyle(fontSize: 13),
                        )),
                      ),
                      SizedBox(
                        height: 50,
                        child: Center(
                            child: Text(
                          'Ảnh',
                          style: TextStyle(fontSize: 13),
                        )),
                      ),
                      SizedBox(
                        height: 50,
                        child: Center(
                            child: Text(
                          'Họ và tên',
                          style: TextStyle(fontSize: 13),
                        )),
                      ),
                      SizedBox(
                        height: 50,
                        child: Center(
                            child: Text(
                          'Giới tính',
                          style: TextStyle(fontSize: 13),
                        )),
                      ),
                      SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Thao tác',
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...List<TableRow>.generate(
                    displayGroupDraft.studentList.length,
                    (index) => TableRow(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                      ),
                      children: [
                        SizedBox(
                          child: Center(
                              child: Text(
                            '${index + 1}',
                            style: const TextStyle(fontSize: 13),
                          )),
                        ),
                        SizedBox(
                          height: 100,
                          child: Image(
                            fit: BoxFit.cover,
                            image: displayGroupDraft.studentList[index].imageFile != null
                                ? MemoryImage(
                                    displayGroupDraft.studentList[index].imageFile!)
                                : MemoryImage(defaultImage),
                          ),
                        ),
                        SizedBox(
                          child: Center(
                            child: Text(
                              displayGroupDraft.studentList[index].name,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Center(
                            child: Text(
                              displayGroupDraft.studentList[index].sex,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Center(
                            child: Column(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Xác nhận xóa'),
                                        content: const Text(
                                            'Đồng ý xóa học sinh này!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Không'),
                                          ),
                                          TextButton(
                                            onPressed: () => {
                                              Navigator.pop(context),
                                              setState(
                                                () {
                                                  removeStudentFromListGroup(displayGroupDraft.studentList, displayGroupDraft.studentList[index].id);
                                                },
                                              ),
                                            },
                                            child: const Text('Có'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text('Xóa'),
                                ),
                                const SizedBox(height: 5),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DisplayStudentDetail(
                                          student: searchStudentWithId(displayGroupDraft.studentList[index].id),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text('Chi tiết'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}