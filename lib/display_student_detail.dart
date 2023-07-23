import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'data.dart';

class DisplayStudentDetail extends StatefulWidget {
  const DisplayStudentDetail({super.key, required this.student});
  final Student student;
  @override
  State<DisplayStudentDetail> createState() => _DisplayStudentDetailState();
}

class _DisplayStudentDetailState extends State<DisplayStudentDetail> {
  final _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<Type>> types = dataTypeList
      .map(
        (type) => DropdownMenuItem(
          value: type,
          child: Text(type.name),
        ),
      )
      .toList();
  @override
  Widget build(BuildContext context) {
    Student student = widget.student;
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
                   SizedBox(
                      height: 100,
                      width: 70,
                      child: Image(
                        fit: BoxFit.cover,
                        image: FileImage(File(student.image!.path)),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      children: [
                        SizedBox(
                          width: 150,
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
                                  value: student.type,
                                  items: types,
                                  onSaved: (value) {
                                    student.type = value!;
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
                              _formKey.currentState!.save();
                              getStudent();
                              getType();
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