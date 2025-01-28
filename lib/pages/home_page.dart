import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '/data/book_data.dart';
import '/widgets/book_widget.dart';
import '/constants.dart';

final _url = Uri.parse('https://o2tech.com.au');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colour,
      body: Container(
        height: mediaHeight > mediaWidth ? mediaHeight : null,
        width: mediaWidth > mediaHeight ? mediaWidth : null,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/tree_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: mediaHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: mediaWidth - 100,
                              child: Text(
                                "Sam's Booklist",
                                style: GoogleFonts.oxygen(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 70,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Oxygen',
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        offset: Offset(2, 2),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                softWrap: true,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 30),
                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  child: Image.asset(
                                    'images/logo-white.png',
                                    fit: BoxFit.contain,
                                    height: 50,
                                  ),
                                  onTap: () => _launchUrl(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "A collection of the 100 books which have had the greatest impact on my life.",
                          style: GoogleFonts.oxygen(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Oxygen',
                            ),
                          ),
                          maxLines: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BookWidget(
                books: books,
                scrollController: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
