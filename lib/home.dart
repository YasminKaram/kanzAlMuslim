import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Tabs/Ahadeth.dart';
import 'package:islami/Tabs/Radio.dart';
import 'package:islami/Tabs/Sebha.dart';
import 'package:islami/Tabs/Settings.dart';
import 'package:islami/Tabs/quran.dart';
import 'package:provider/provider.dart';

import 'Providers/MyProvider.dart';

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
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        provider.themeingMode == ThemeMode.light
            ? Image.asset(
                "assets/images/light.jpg",
                width: double.infinity,
                fit: BoxFit.fill,
                height: double.infinity,
              )
            : Image.asset(
                "assets/images/dark.jpeg",
                width: double.infinity,
                fit: BoxFit.fill,
                height: double.infinity,
              ),
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
                    backgroundColor: Theme.of(context).colorScheme.background,
                    icon: ImageIcon(AssetImage("assets/images/quran.png")),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    icon: ImageIcon(AssetImage("assets/images/ahdeth.png")),
                    label: AppLocalizations.of(context)!.ahadeth),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
            body: tabs[index]),
      ],
    );
  }
}
