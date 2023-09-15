import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/MyThemedata.dart';
import 'package:islami/SuraModel.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadfile(args.index);
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.name, style: Theme.of(context).textTheme.bodyLarge),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: MyThemeData.primaryColor)),
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  endIndent: 40,
                  indent: 40,
                  color: MyThemeData.primaryColor),
              itemBuilder: (context, index) {
                return Text(
                  verses[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
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
