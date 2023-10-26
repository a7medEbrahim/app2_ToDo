import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Providers/myProvider.dart';
import '../shared/stayles/colors.dart';

class MoodBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      color: provider.mode == ThemeMode.light ? Colors.white : Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                provider.changeMode(ThemeMode.light);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text(provider.languageCode == "en" ? "Light" : "فاتح",
                      style: TextStyle(
                        fontSize: 30,
                        color: provider.mode == ThemeMode.dark
                            ? Colors.white
                            : Colors.black,
                      )),
                  Spacer(),
                  provider.mode == ThemeMode.light
                      ? Icon(
                          Icons.done,
                          color: primary,
                          size: 35,
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                provider.changeMode(ThemeMode.dark);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text(provider.languageCode == "en" ? "Dark" : "غامق",
                      style: TextStyle(
                          color: provider.mode == ThemeMode.dark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 30)),
                  Spacer(),
                  provider.mode == ThemeMode.light
                      ? SizedBox.shrink()
                      : Icon(
                          Icons.done,
                          color: primary,
                          size: 35,
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
