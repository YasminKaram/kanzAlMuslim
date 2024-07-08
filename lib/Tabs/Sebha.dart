import 'package:flutter/material.dart';
import 'package:islami/MyThemedata.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int count = 0;

  List<String> words = [
    "سبحان الله",
    "الحمدلله",
    " الله اكبر",
    "لا اله الا الله"
  ];

  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/head_of_seb7a.png",
          ),
          Center(
            heightFactor: 0.8,
            child: InkWell(
              child: Transform.rotate(
                  angle: angle,
                  child: Image.asset(
                    "assets/images/body_of_seb7a.png",
                  )),
              onTap: () {
                if (index < words.length) {
                  count++;
                  if (count == 34) {
                    index++;
                    count = 0;
                    if (index >= words.length) {
                      index = 0;
                    }
                  }
                }

                setState(() {
                  angle++;
                });
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text("Tasbeeh Counter",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 24)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "$count",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              color: MyThemeData.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              margin: EdgeInsets.all(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${words[index]}",
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              color: MyThemeData.primaryColor,
              margin: EdgeInsets.all(2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
          )
        ],
      ),
    );
  }
}
