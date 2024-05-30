import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/pages/home_page.dart';
// import 'pages/demo_animate.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  runApp(const SamsBookList());
}

class SamsBookList extends StatelessWidget {
  const SamsBookList({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
