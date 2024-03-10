import 'package:flutter/material.dart';
import '/pages/home_page.dart';

void main() => runApp(const SamsBookList());

class SamsBookList extends StatelessWidget {
  const SamsBookList({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
