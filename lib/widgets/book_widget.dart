import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/constants.dart';
import '/models/book_model.dart';

class BookWidget extends StatelessWidget {
  final List<Book> books;

  const BookWidget({
    super.key,
    required this.books,
  });

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return SizedBox(
            width: mediaWidth > 750 ? mediaWidth / 2 : mediaWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 44,
                      child: Text(
                        books[index].rank,
                        style: headingStyle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: mediaWidth - 93,
                        child: TextButton(
                          onPressed: () =>
                              _launchUrl(Uri.parse(books[index].url)),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              books[index].title,
                              style: headingStyle,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                gapH16,
                Row(
                  children: [
                    gapW62,
                    SizedBox(
                      width: mediaWidth - 94,
                      child: Text(
                        books[index].author,
                        style: bodyStyle,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
                gapH16,
                Row(
                  children: [
                    gapW62,
                    Image.asset(
                      books[index].coverImage,
                      fit: BoxFit.cover,
                      width: mediaWidth > 750 ? 200 : 100,
                      height: mediaWidth > 750 ? 300 : 150,
                    ),
                  ],
                ),
                gapH16,
                Row(
                  children: [
                    gapW62,
                    for (int i = 0; i < books[index].rating; i++)
                      Image.asset(
                        'images/logo.png',
                        width: 24,
                      ),
                    for (int i = 0; i < 10 - books[index].rating; i++)
                      Image.asset(
                        'images/logo-white.png',
                        width: 24,
                      ),
                    const SizedBox(width: 16),
                    Text('${books[index].rating}/10', style: bodyStyle),
                  ],
                ),
                gapH16,
                const Divider(),
              ],
            ),
          );
        },
        itemCount: books.length,
      ),
    );
  }
}
