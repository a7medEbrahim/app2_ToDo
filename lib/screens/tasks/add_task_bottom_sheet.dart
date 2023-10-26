import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/Models/taskMode.dart';
import 'package:todo/shared/network/firebase/firebaseManager.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add New Task',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "enter your task",
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: "enter your description",
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
            child: Text(selectedDate.toString().substring(0, 10),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.blue)),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                TaskModel task = TaskModel(
                    userId: FirebaseAuth.instance.currentUser!.uid,
                    title: titleController.text,
                    describtion: descriptionController.text,
                    date: DateUtils.dateOnly(selectedDate)
                        .millisecondsSinceEpoch);
                FirebaseManager.addTask(task);
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Successfully"),
                        content: Text("Task Added Successfully"),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text("Okay"))
                        ],
                      );
                    });
              },
              child: Text('Add Task'))
        ],
      ),
    );
  }

  selectDate() async {
    DateTime? choosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    selectedDate = choosenDate ?? selectedDate;
    setState(() {});
  }
}
