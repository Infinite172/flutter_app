import 'package:flutter/material.dart';
import 'package:flutter_app/data/consants.dart';
import 'package:flutter_app/views/widgets/container_widget.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

  List<String> list = [
    KValue.basicLayout,
    KValue.cleanUi,
    KValue.fixBugs,
    KValue.keyConcepts
  ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
        HeroWidget(title: ""),

        // Column(children:
        //     List.generate(2, (index) { 
        //     return HeroWidget(title: "");
        //   },
        //   )
        // ),

        SizedBox(height: 30.0),


        ...List.generate(list.length,  (index) { 
            return ContainerWidget(title: list.elementAt(index));
          },
        ),

        ],
      ),
    ),
    );
  }
}