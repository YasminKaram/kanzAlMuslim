import 'package:flutter/material.dart';
import 'package:islami/AhadethDetails.dart';
import 'package:islami/MyThemedata.dart';
import 'package:islami/home.dart';
import 'package:islami/suraDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          SuraDetails.routeName: (context) => SuraDetails(),
          AhadethDetails.routeName: (context) => AhadethDetails(),
        },
        theme: MyThemeData.lightTheme,
        darkTheme: MyThemeData.darkTheme);
  }
}
