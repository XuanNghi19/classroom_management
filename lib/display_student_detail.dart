import 'dart:io';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'student.dart';
import 'modulus.dart';
import 'group.dart';
import 'package:image_picker/image_picker.dart';

class DisplayStudentDetail extends StatefulWidget {
  const DisplayStudentDetail({super.key, required this.student});
  final Student student;
  @override
  State<DisplayStudentDetail> createState() => _DisplayStudentDetailState();
}

class _DisplayStudentDetailState extends State<DisplayStudentDetail> {
  final _formKey = GlobalKey<FormState>();
  final boxDefault = Hive.box('boxDefault');
  Uint8List? imagee;

  @override
  Widget build(BuildContext context) {
    Student student = widget.student;
    student.imageFile != null ? imagee = Uint8List.fromList(student.imageFile!) : null;

    Future pickImage(ImageSource source) async {
      try {
        final image = await ImagePicker().pickImage(source: source);
        if (image == null) {
          return;
        }

        // Xfile -> File
        final imageTemporary = File(image.path);
        // File -> Uint8List?
        Uint8List? img = await imageTemporary.readAsBytes();

        setState(() {
          debugPrint(img.toString());
          debugPrint(imagee.toString());
          imagee = img;
        });
      } on PlatformException catch (e) {
        debugPrint('Failed to pick image: $e');
      }
    }

    List<DropdownMenuItem<String>> groups = dataGroup.map((group) {
      return DropdownMenuItem(
        value: group.name,
        child: Text(group.name),
      );
    }).toList();

    Uint8List defaultImage = boxDefault.get('imageProfileDefaut');

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        toolbarHeight: 75,
        centerTitle: true,
        title: const Text(
          'Chi tiết học sinh',
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
        // height: ,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor.withOpacity(0.25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: imagee != null
                                      ? MemoryImage(imagee!)
                                      : MemoryImage(defaultImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: 100,
                              width: 70,
                            ),
                            onPressed: () async {
                              debugPrint('aaa ${imagee.toString()}');
                              await pickImage(ImageSource.gallery);
                              debugPrint(imagee.toString());
                            }),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Column(
                      children: [
                        SizedBox(
                          width: 165,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Họ và tên / Full Name:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                TextFormField(
                                  initialValue: student.name,
                                  decoration: const InputDecoration(
                                    hintText: 'Vui lòng nhập tên!',
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Việc nhập này là bắt buộc'
                                      : null,
                                  onSaved: (value) {
                                    student.name = value!;
                                  },
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Giới tính / Sex:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                TextFormField(
                                  initialValue: student.sex,
                                  decoration: const InputDecoration(
                                    hintText: 'Vui lòng nhập giới tính!',
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Việc nhập này là bắt buộc'
                                      : null,
                                  onSaved: (value) {
                                    student.sex = value!;
                                  },
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Lớp / Class:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                DropdownButtonFormField(
                                  value: student.group,
                                  items: groups,
                                  onSaved: (value) {
                                    student.group = value!;
                                  },
                                  onChanged: (value) {},
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Quê quán / Home Town:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                TextFormField(
                                  initialValue: student.homeTown,
                                  decoration: const InputDecoration(
                                    hintText: 'Vui lòng nhập quê quán!',
                                  ),
                                  validator: (value) => value!.isEmpty
                                      ? 'Việc nhập này là bắt buộc'
                                      : null,
                                  onSaved: (value) {
                                    student.homeTown = value!;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Xác nhận lưu'),
                        content: const Text('Đồng ý sửa học sinh này!'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Không'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'DisplayClassList');
                              student.imageFile = imagee;
                              _formKey.currentState!.save();
                              setStudent();
                              setGroup();
                              setlocalStudentData();
                            },
                            child: const Text('Có'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Lưu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
