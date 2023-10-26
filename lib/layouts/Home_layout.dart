import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/myProvider.dart';
import 'package:todo/Registration/Register.dart';
import 'package:todo/screens/settings/setting_bottom_sheet.dart';
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

  // List<Widget> tabs = [TasksTab(), Settings()];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(provider.languageCode == "en"
            ? "Welcome in ToDo"
            : "مرحبا بك في ToDo"),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, Register.routeName, (route) => false);
              },
              icon: Icon(
                  provider.languageCode == "en" ? Icons.output : Icons.input))
        ],
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
      body: TasksTab(),
      bottomNavigationBar: BottomAppBar(
        color: provider.mode == ThemeMode.light ? Colors.white : Colors.blue,
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
            elevation: 0,
            // currentIndex: index,
            // onTap: (value) {
            //   index = value;
            //   setState(() {});
            // },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_rounded), label: ""),
              BottomNavigationBarItem(
                  icon: InkWell(
                      onTap: () {
                        showSettingBottomSheet();
                      },
                      child: Icon(Icons.settings)),
                  label: ""),
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

  showSettingBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SettingsBottomSheet(),
        );
      },
    );
  }
}
