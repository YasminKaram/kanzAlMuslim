import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/radioModel.dart';

import 'MyThemedata.dart';

class RadioItem extends StatelessWidget {
  final AudioPlayer audioPlayer;
  final Radios radios;

  const RadioItem({super.key, required this.radios, required this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(radios.name ?? "",
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 24)),
        SizedBox(
          height: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    stop();
                  },
                  child: Icon(Icons.pause,
                      color: MyThemeData.primaryColor, size: 50)),
              InkWell(
                onTap: () {
                  play();
                },
                child: ImageIcon(
                  const AssetImage("assets/images/Icon awesome-play.png"),
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

  void play() async {
    await audioPlayer.play(UrlSource(radios.url ?? ""));
  }

  void stop() async {
    await audioPlayer.stop();
  }
}
