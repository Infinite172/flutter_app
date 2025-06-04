import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/login_page.dart';
// import 'package:flutter_app/views/widget_tree.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dragon Ball'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                FittedBox(
                child: Text(
                  "Dragon Ball",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 20.0,
                  ),
                ),
              ),

                SizedBox(height: 20.0),
                HeroWidget(title: ""),
                SizedBox(height: 20.0),
                Text("Dragonball Z is a Japanese anime series created by Akira Toriyama. Dragonball Z is known for its intense battles, iconic characters, and themes of friendship and perseverance.",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 16.0,
                ),),
                ElevatedButton(
                  onPressed: () {        
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage(title: 'Register');
                      },
                    ),
                  );
                    },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50.0),
                  ),
                child: Text("Next")
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ),
      ),
      );
  }
}