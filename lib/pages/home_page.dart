import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/data/book_data.dart';
import '/widgets/book_widget.dart';
import '/constants.dart';

final _url = Uri.parse('https://oxygentech.com.au');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colour,
      appBar: AppBar(
        title: appTitle,
        automaticallyImplyLeading: false,
        backgroundColor: colour,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: InkWell(
              child: Image.asset(
                'images/logo-white.png',
                fit: BoxFit.contain,
                height: 24.0,
              ),
              onTap: () => _launchUrl(),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: BookWidget(
          books: books,
        ),
      ),
    );
  }
}
