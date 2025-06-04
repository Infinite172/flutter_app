import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Row(
          //   children: [
          //     Expanded(
          //       flex:3,
          //       child: Container(
          //       height:20,
          //       color: Colors.lightBlueAccent,
          //     )
          //   ),
          //   Flexible(
          //     flex: 2,
          //     child: Container(
          //       height:20,
          //       color: Colors.tealAccent,
          //       child: Text("data"),
          //     )
          //   )
          //   ],
          // ),
          Row(
            children: [
              Flexible(
              child: Container(
                height:20,
                color: Colors.tealAccent,
                child: Text("data", style: TextStyle(color: Colors.black),),
              )
            ),
              Expanded(
                child: Container(
                height:20,
                color: Colors.lightBlueAccent,
              )
            ),
            ],
          ),
        ],
      ),
    );
  }
}