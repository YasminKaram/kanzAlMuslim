import 'package:flutter/material.dart';
import 'package:islami/MyThemedata.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
        ),
        Center(
          child: Image.asset("assets/images/radio_image.png"),
        ),
        Text("Quran Kareem Radio",
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 24)),
        SizedBox(
          height: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: ImageIcon(
                    AssetImage("assets/images/Icon metro-next.png"),
                    color: MyThemeData.primaryColor,
                    size: 50),
              ),
              InkWell(
                child: ImageIcon(
                  AssetImage("assets/images/Icon awesome-play.png"),
                  color: MyThemeData.primaryColor,
                  size: 50,
                ),
              ),
              InkWell(
                child: ImageIcon(
                  AssetImage("assets/images/Icon metro-back.png"),
                  color: MyThemeData.primaryColor,
                  size: 50,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
