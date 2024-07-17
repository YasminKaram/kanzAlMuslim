import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/AhadethDetails.dart';
import 'package:islami/MyThemedata.dart';
import 'package:islami/hadethModel.dart';

class AhadethScreen extends StatefulWidget {
  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  List<HadethModel> allAhadeth = [];

  @override
  void initState() {
    // TODO: implement initState
    loadFile();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loadFile();

    return Column(
      children: [
        Center(child: Image.asset("assets/images/ahadeth_image.png")),
        Divider(
          color: MyThemeData.primaryColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!,
        ),
        Divider(
          color: MyThemeData.primaryColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
                color: MyThemeData.primaryColor,
                indent: 40,
                endIndent: 40,
                thickness: 1),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AhadethDetails.routeName,
                      arguments: allAhadeth[index]);
                },
                child: Text(
                  allAhadeth[index].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!,
                ),
              );
            },
            itemCount: allAhadeth.length,
          ),
        )
      ],
    );
  }

  void loadFile() async {
    await rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        List<String> hadethLines = ahadethList[i].trim().split("\n");
        String title = hadethLines[0];
        hadethLines.removeAt(0);
        List<String> content = hadethLines;
        HadethModel hadethmodel = HadethModel(title, content);
        allAhadeth.add(hadethmodel);
      }
    }).catchError((e) {
      print(e.toString());
    });
    setState(() {});
  }
}
