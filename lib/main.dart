import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        },
        theme: MyThemeData.lightTheme,
        darkTheme: MyThemeData.darkTheme);
  }
}
