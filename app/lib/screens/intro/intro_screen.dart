import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'intro_page_1.dart';
import 'intro_page_2.dart';
import 'intro_page_3.dart';
import 'intro_page_4.dart'; // Importa la nueva pantalla

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(), // Agrega la nueva pantalla aquí
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4, // Actualiza el contador a 4
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.pinkAccent,
                dotColor: Colors.pink.shade100,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
