import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/MyThemedata.dart';
import 'package:islami/Tabs/Ahadeth.dart';
import 'package:islami/Tabs/Radio.dart';
import 'package:islami/Tabs/Sebha.dart';
import 'package:islami/Tabs/Settings.dart';
import 'package:islami/Tabs/quran.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Quran";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> tabs = [
    QuranScreen(),
    SebhaScreen(),
    RadioScreen(),
    AhadethScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/background.png",
            width: double.infinity, fit: BoxFit.fill),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.appaTitle,
                    style: Theme.of(context).textTheme.bodyLarge)),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    backgroundColor: MyThemeData.primaryColor,
                    icon: ImageIcon(AssetImage("assets/images/quran.png")),
                    label: "Quran"),
                BottomNavigationBarItem(
                    backgroundColor: MyThemeData.primaryColor,
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: "Sebha"),
                BottomNavigationBarItem(
                    backgroundColor: MyThemeData.primaryColor,
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: "Radio"),
                BottomNavigationBarItem(
                    backgroundColor: MyThemeData.primaryColor,
                    icon: ImageIcon(AssetImage("assets/images/ahdeth.png")),
                    label: "Ahadeth"),
                BottomNavigationBarItem(
                    backgroundColor: MyThemeData.primaryColor,
                    icon: Icon(Icons.settings),
                    label: "Settings"),
              ],
            ),
            body: tabs[index]),
      ],
    );
  }
}
