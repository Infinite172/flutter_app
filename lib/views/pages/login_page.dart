import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_app/views/widget_tree.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
TextEditingController controllerEmail = TextEditingController(text: "123");
TextEditingController controllerPassword = TextEditingController(text: 'qwe');
String confirmEmail = "123";
String confirmPsd = "qwe";

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
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
            child: LayoutBuilder(builder: (context, constraints) {
              return FractionallySizedBox(
              widthFactor: widthScreen > 500 ? 0.8 : 1.0,
              child: Column(
                children: [
                  FittedBox(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 20.0,
                    ),
                  ),
                ),
                  SizedBox(height: 20.0),
                  // HeroWidget(title: ""),
                  Lottie.asset('assets/lotties/game.json'),
                  SizedBox(height: 20.0),
                        
                  TextField(
                    controller: controllerEmail,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onEditingComplete: () {
                    },
                  ),
                        
                   SizedBox(height: 20.0),
                        
                  TextField(
                    controller: controllerPassword,
                    decoration: InputDecoration(
                      hintText: "Enter your Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onEditingComplete: () {
                    },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {        
                      onLoginPressed();
                      },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50.0),
                    ),
                  child: Text(widget.title)
                  ),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            );
            }
            )
          ),
        ),
      ),
      );
  }

  void onLoginPressed () {
    if (confirmEmail == controllerEmail.text && confirmPsd == controllerPassword.text) {
      Navigator.pushAndRemoveUntil(context, 
          MaterialPageRoute(builder: (context) {
            return WidgetTree();
          },
        ),
        (route) => false,
      );      
    }
  }
}