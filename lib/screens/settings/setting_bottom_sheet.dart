import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../BottomSheets/LanguagesBottomSheet.dart';
import '../../BottomSheets/MoodBottomSheet.dart';
import '../../Providers/myProvider.dart';
import '../../shared/stayles/colors.dart';

class SettingsBottomSheet extends StatefulWidget {
  const SettingsBottomSheet({super.key});

  @override
  State<SettingsBottomSheet> createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      color: provider.mode == ThemeMode.light ? Colors.white : Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(provider.languageCode == "en" ? "Language" : "اللغة",
                style: TextStyle(
                    color: provider.mode == ThemeMode.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: 30)),
            InkWell(
              onTap: () {
                showLanguageBottomSheet();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                padding: EdgeInsets.symmetric(horizontal: 18),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: primary)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(provider.language,
                      style: TextStyle(
                        fontSize: 20,
                        color: provider.mode == ThemeMode.dark
                            ? Colors.white
                            : Colors.black,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              provider.languageCode == "en" ? "Mood" : "مود",
              style: TextStyle(
                  color: provider.mode == ThemeMode.dark
                      ? Colors.white
                      : Colors.black,
                  fontSize: 30),
            ),
            InkWell(
              onTap: () {
                showThemingBottomSheet();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                padding: EdgeInsets.symmetric(horizontal: 18),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: primary)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    provider.mode == ThemeMode.light
                        ? provider.languageCode == "en"
                            ? "Light"
                            : "فاتح"
                        : provider.languageCode == "en"
                            ? "Dark"
                            : "غامق",
                    style: TextStyle(
                      color: provider.mode == ThemeMode.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        builder: (context) => LanguageBottomSheet());
  }

  showThemingBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      builder: (context) => MoodBottomSheet(),
    );
  }
}
