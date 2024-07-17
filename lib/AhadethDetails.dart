import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyThemedata.dart';
import 'Providers/MyProvider.dart';
import 'hadethModel.dart';

class AhadethDetails extends StatelessWidget {
  static const String routeName = "AhdethDetails";

  const AhadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: pro.themeingMode == ThemeMode.light
                  ? AssetImage("assets/images/light.jpg")
                  : AssetImage("assets/images/dark.jpeg"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title, style: Theme.of(context).textTheme.bodyLarge),
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
                    args.Content[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              },
              itemCount: args.Content.length,
            ),
          ),
        ),
      ),
    );
  }
}
