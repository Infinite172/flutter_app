import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/login_page.dart';
import 'package:flutter_app/views/pages/onboarding.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dragon Ball'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 20.0,
                  ),
                ),
              ),
              SizedBox(height: 50),
              HeroWidget(title: ""),
              Lottie.asset('assets/lotties/home.json',
              height: 200.0),
              SizedBox(height: 20.0),
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OnBoardingPage();
                      },
                    ),
                  );
                },
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.0),
                ),
                child: Text("Get Started"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage(title: 'Login');
                      },
                    ),
                  );
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
