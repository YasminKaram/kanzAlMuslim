import 'package:flutter/material.dart';

import 'MyThemedata.dart';
import 'hadethModel.dart';

class AhadethDetails extends StatelessWidget {
  static const String routeName = "AhdethDetails";

  const AhadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title, style: Theme.of(context).textTheme.bodyLarge),
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
                  args.Content[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
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
