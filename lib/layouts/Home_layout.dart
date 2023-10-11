import 'package:flutter/material.dart';
import 'package:todo/screens/settings/settings_tab.dart';
import 'package:todo/screens/tasks/TasksTab.dart';

import '../screens/tasks/add_task_bottom_sheet.dart';
import '../shared/stayles/colors.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;

  List<Widget> tabs = [TasksTab(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskBottomSheet();
        },
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.5,
            )),
        child: Icon(Icons.add, size: 30),
      ),
      body: tabs[index],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
            elevation: 0,
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_rounded), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
            ]),
      ),
    );
  }

  showAddTaskBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskBottomSheet(),
        );
      },
    );
  }
}
