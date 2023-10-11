import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/layouts/Home_layout.dart';
import 'package:todo/shared/stayles/themeing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
      },
      themeMode: ThemeMode.light,
      theme: MyThemeData.lightMood,
    );
  }
}
