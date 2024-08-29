import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink.shade100, Colors.purple.shade300],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/undraw_adventure.svg',
            height: 250,
          ),
          SizedBox(height: 30),
          Text(
            "Organicemos nuestras ideas",
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(
                fontSize: 28,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black45,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
