import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/MyThemedata.dart';
import 'package:islami/SuraModel.dart';
import 'package:provider/provider.dart';

import 'Providers/MyProvider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadfile(args.index);
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: pro.themeingMode == ThemeMode.light
                  ? AssetImage("assets/images/light.jpg")
                  : AssetImage("assets/images/dark.jpeg"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.name, style: Theme.of(context).textTheme.bodyLarge),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            color: pro.themeingMode == ThemeMode.light
                ? Color(0xffFFF7F1)
                : Colors.black12,
            elevation: 12,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: MyThemeData.primaryColor)),
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                  thickness: 0.25,
                  endIndent: 40,
                  indent: 40,
                  color: MyThemeData.primaryColor),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${verses[index]} (${index + 1})",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              },
              itemCount: verses.length,
            ),
          ),
        ),
      ),
    );
  }

  loadfile(int index) async {
    String file = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> Lines = file.split("\n");
    verses = Lines;
    setState(() {});
  }
}
