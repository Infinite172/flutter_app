import 'package:flutter/material.dart';
import 'package:flutter_app/data/notifiers.dart';
import 'package:flutter_app/views/pages/welcome_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/image/logo.png')
          ),
            FilledButton(onPressed: () {
              selectedPageNotifier.value = 0; // Reset to home page
              Navigator.pushReplacement(context, 
                MaterialPageRoute(
                  builder: (context) { return WelcomePage();}
                  )
              );
            }, child: Text("Logout")
            ),

            IconButton(onPressed: (){
              setState(() {
                isFirst = !isFirst;
              });
              },
              icon: Icon(Icons.catching_pokemon,
              color: Colors.amber,
              size: 50
              )
            ),
            AnimatedCrossFade(
              firstChild: 
              Image.asset(
                'assets/image/45.jpg',
                fit: BoxFit.cover,
              ),
              secondChild: 
              Image.asset(
                'assets/image/46.jpg',
                fit: BoxFit.cover,
              ),
              crossFadeState: isFirst? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: Duration(seconds: 2),
              )
          ],
        ),
      ),
    );
  }
}