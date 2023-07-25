import 'package:flutter/material.dart';
import 'display_data.dart';
import 'display_student_list.dart';

class DisplayClassList extends StatefulWidget {
  const DisplayClassList({super.key});

  @override
  State<DisplayClassList> createState() => _DisplayClassListState();
}

class _DisplayClassListState extends State<DisplayClassList> {
  final List<bool> _isExpended =
      List.generate(displayBlock.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        toolbarHeight: 75,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, 'Home');
          },
        ),
        centerTitle: true,
        title: const Text(
          'Danh sách lớp học',
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: displayBlock.length,
          itemBuilder: (context, index) {
            final dataBlock = displayBlock[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpended[index] = !_isExpended[index];
                    });
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Khối ${dataBlock.name}'),
                        const Icon(Icons.expand_more),
                      ],
                    ),
                  ),
                ),
                if (_isExpended[index]) const SizedBox(height: 5),
                if (_isExpended[index])
                  Column(
                    children: List.generate(
                      dataBlock.typeList.length,
                      (i) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayStudentList(
                                displayTypeDraft: dataBlock.typeList[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 10),
                          margin: const EdgeInsets.only(bottom: 5),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          child: Text('Lớp ${dataBlock.typeList[i].name}'),
                        ),
                      ),
                    ),
                  ),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}