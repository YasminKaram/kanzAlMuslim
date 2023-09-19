import 'package:flutter/material.dart';
import 'package:islami/MyThemedata.dart';

class AhadethScreen extends StatelessWidget {
  const AhadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset("assets/images/ahadeth_image.png")),
        Divider(
          color: MyThemeData.primaryColor,
          thickness: 3,
        ),
        Text(
          "Ahadeth",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: MyThemeData.blackColor),
        ),
        Divider(
          color: MyThemeData.primaryColor,
          thickness: 3,
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return;
          },
        )
      ],
    );
  }

  LoadFile(int index) {}
}
