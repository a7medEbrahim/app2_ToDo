import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/shared/network/firebase/firebaseManager.dart';
import 'package:todo/shared/stayles/colors.dart';

import '../../Models/taskMode.dart';
import 'editTask.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;

  TaskItem(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.transparent)),
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18), topLeft: Radius.circular(18)),
            backgroundColor: Colors.red,
            label: "Delete",
            icon: Icons.delete,
            onPressed: (context) {
              FirebaseManager.deleteTask(task.id);
            },
          ),
          SlidableAction(
            backgroundColor: Colors.green,
            label: "Edite",
            icon: Icons.edit,
            onPressed: (context) {
              Navigator.pushNamed(context, EditTask.routeName, arguments: task);
            },
          )
        ]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                height: 62,
                width: 4,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25)),
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 18),
                  ),
                  Text(
                    task.describtion,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                        fontSize: 14),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  task.isDone = true;
                  FirebaseManager.updateTask(task);
                },
                child: task.isDone
                    ? Text(
                        'Done!',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )
                    : Container(
                        width: 69,
                        height: 34,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.done, color: Colors.white, size: 30)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
