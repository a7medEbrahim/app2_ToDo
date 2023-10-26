import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/myProvider.dart';
import 'package:todo/layouts/Home_layout.dart';

import '../../Models/taskMode.dart';
import '../../shared/network/firebase/firebaseManager.dart';

class EditTask extends StatefulWidget {
  static const String routeName = "EditPage";

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  var perviousDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TaskModel task = ModalRoute.of(context)?.settings.arguments as TaskModel;
    // perviousDate = DateTime.fromMillisecondsSinceEpoch(task.date);
    // var selectedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(perviousDate);
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Edit ",
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: task.title,
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: task.describtion,
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 25),
            Text('Select time',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                selectDate();
              },
              child: Text((perviousDate).toString().substring(0, 10),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.blue)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  task.title = titleController.text;
                  task.describtion = descriptionController.text;
                  task.date =
                      DateUtils.dateOnly(perviousDate).millisecondsSinceEpoch;

                  FirebaseManager.updateTask(task).then((value) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Successfully"),
                            content: Text("Task Edited!"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        HomeLayout.routeName, (route) => false);
                                  },
                                  child: Text("Okay"))
                            ],
                          );
                        });
                  });
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }

  selectDate() async {
    DateTime? choosenDate = await showDatePicker(
        context: context,
        initialDate: perviousDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    perviousDate = choosenDate ?? perviousDate;
    setState(() {});
  }
}
