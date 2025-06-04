import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/course_page.dart';


class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CoursePage();
                },
              ),
            );

          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Hero(
                tag: "hero-1",
                child: AspectRatio(
                  aspectRatio: 1920/1080,
                  child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/image/5.jpg',
                              fit: BoxFit.cover,
                            color: Colors.teal,
                            colorBlendMode: BlendMode.colorBurn,
                            ),
                          ),
                ),
              ),
              FittedBox(
                child: Text(title,
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 20.0,
                  color: Colors.purpleAccent,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 5.0,
                    ),
                  ],
                )
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }
}
