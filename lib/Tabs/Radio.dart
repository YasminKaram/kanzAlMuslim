import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/APiManger.dart';
import 'package:islami/radioItme.dart';

import '../radioModel.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 70,
        ),
        Center(
          child: Image.asset("assets/images/radio_image.png",
              height: 200, width: 150),
        ),
        Text(AppLocalizations.of(context)!.quranradio,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 24)),
        FutureBuilder<List<Radios>?>(
          future: ApiManger.getRadios(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SizedBox(
                height: height * 0.3,
                child: ListView.builder(
                  physics: const PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemExtent: width,
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return RadioItem(
                      radios: snapshot.data![index],
                      audioPlayer: audioPlayer,
                    );
                  },
                ),
              );
            }
          },
        )
      ],
    );
  }
}
