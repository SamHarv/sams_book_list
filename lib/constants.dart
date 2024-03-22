import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// const colour = Color.fromARGB(255, 55, 72, 84);
const colour = Colors.black;

const gapW62 = SizedBox(width: 62);
const gapH16 = SizedBox(height: 16);

const TextStyle headingStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Roboto',
  fontSize: 24,
);

const TextStyle bodyStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Roboto',
  fontSize: 18,
);

final appTitle = Text(
  'Sam\'s Book List',
  style: GoogleFonts.caveat(
    textStyle: const TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontFamily: 'Caveat',
    ),
  ),
);
