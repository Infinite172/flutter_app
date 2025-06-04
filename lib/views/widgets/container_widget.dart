import 'package:flutter/material.dart';
import 'package:flutter_app/data/consants.dart';
import 'package:lottie/lottie.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key, required this.title});

final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
            width: double.infinity,
            child: Card(
            //  margin: EdgeInsets.zero,
             color: Colors.deepOrangeAccent,
             child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                    style: KTextStyle.titleText,
                  ),
                  Lottie.asset('assets/lotties/home.json',
                  height: 100),
                  Text("Dragonball Z is a Japanese anime series created by Akira Toriyama. Dragonball Z is known for its intense battles, iconic characters, and themes of friendship and perseverance.",
                    style: KTextStyle.bodyText,
                  ),
                ],
              ),
              ),
            ),
          );
  }
}