import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/MyThemedata.dart';
import 'package:islami/bottomsheet/LanguageBottomSheet.dart';
import 'package:islami/bottomsheet/ThemeBottomSheet.dart';
import 'package:provider/provider.dart';

import '../Providers/MyProvider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Language",
                  style: Theme.of(context).textTheme.bodyLarge)),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.symmetric(horizontal: 18),
              width: double.infinity,
              child: Text(
                  pro.languageCode == "en"
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: pro.themeingMode == ThemeMode.light
                          ? MyThemeData.blackColor
                          : Colors.white)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: MyThemeData.primaryColor)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Themeing",
                  style: Theme.of(context).textTheme.bodyLarge)),
          InkWell(
            onTap: () {
              showThemeingBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.symmetric(horizontal: 18),
              width: double.infinity,
              child: Text(
                  pro.themeingMode == ThemeMode.light ? "Light" : "Dark",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: pro.themeingMode == ThemeMode.light
                          ? MyThemeData.blackColor
                          : Colors.white)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: MyThemeData.primaryColor)),
            ),
          ),
        ],
      ),
    );
  }

  showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),
        builder: (context) => LanguageBottomSheet());
  }

  showThemeingBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),
        builder: (context) => ThemeingBottomSheet());
  }
}
