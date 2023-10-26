import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo/shared/stayles/colors.dart';

import '../Providers/myProvider.dart';

class LanguageBottomSheet extends StatelessWidget {
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
                provider.changeLanguage('en');
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text(
                    provider.languageCode == "en" ? "Englis" : "انجليزي",
                    style: TextStyle(
                      fontSize: 30,
                      color: provider.mode == ThemeMode.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  Spacer(),
                  provider.languageCode == "en"
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
                provider.changeLanguage('ar');
                print(provider.languageCode);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text(provider.languageCode == "en" ? "Arabic" : "عربي",
                      style: TextStyle(
                        fontSize: 30,
                        color: provider.mode == ThemeMode.dark
                            ? Colors.white
                            : Colors.black,
                      )),
                  Spacer(),
                  provider.languageCode == "en"
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
