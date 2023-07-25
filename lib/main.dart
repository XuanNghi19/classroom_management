import 'package:flutter/material.dart';
import 'display_class_list.dart';
import 'block.dart';
import 'group.dart';
import 'student.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'modulus.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(BlockAdapter());
  final localBlockData = await Hive.openBox<Block>('localBlockData');
  final localGroupData = await Hive.openBox<Group>('localGroupData');
  final localStudentData = await Hive.openBox<Student>('localStudentData');

  localBlockData.clear();
  localGroupData.clear();
  localStudentData.clear();

  localBlockData.isEmpty ? {
    localBlockData.addAll(dataBlock),
  } : {
    dataBlock.addAll(localBlockData.values),
    debugPrint(dataBlock.toString()),
  };
  
  localGroupData.isEmpty ? {
    localGroupData.addAll(dataGroup),
  } : {
    dataGroup.addAll(localGroupData.values),
    debugPrint(dataGroup.toString()),
  };
  
  localStudentData.isEmpty ? {
    localStudentData.addAll(dataStudent),
  } : {
    dataStudent.addAll(localStudentData.values),
    debugPrint(dataStudent.toString()),
  };

  localBlockData.close;
  localGroupData.close;
  localStudentData.close;

  setStudent();
  setType();
  setBlock();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý lớp học',
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: const Home(),
      routes: <String, WidgetBuilder>{
        'Home': (context) => const Home(),
        'DisplayClassList': (context) => const DisplayClassList(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _changeColor = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        toolbarHeight: 75,
        centerTitle: true,
        title: const Text(
          'Quản lý lớp học',
        ),
        leading: GestureDetector(
          onTap: () {},
        ),
      ),
      body: Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onFocusChange: (isTap) => setState(
                        () {
                          _changeColor = !_changeColor;
                        },
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DisplayClassList(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(64, 64),
                        padding: const EdgeInsets.all(5),
                        backgroundColor:
                            _changeColor ? Colors.white : Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Image.asset('images/icons8-list-100.png'),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    const Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'Danh sách',
                        style: TextStyle(fontSize: 13),
                        children: [
                          TextSpan(text: '\n', style: TextStyle(fontSize: 10),),
                          TextSpan(text: 'lớp học', style: TextStyle(fontSize: 13),),
                        ], 
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}