import 'package:flutter/material.dart';
import 'package:todo/Registration/Login.dart';
import 'package:todo/Registration/Singnup.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  static const String routeName = "RegisterPage";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('ToDo App'),
          bottom: TabBar(tabs: [
            Tab(
              text: "Login",
            ),
            Tab(
              text: "SignUp",
            ),
          ]),
        ),
        body: TabBarView(
          children: [LoginScreen(), SignUp()],
        ),
      ),
    );
  }
}
