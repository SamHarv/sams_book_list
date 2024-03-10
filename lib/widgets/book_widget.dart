import 'package:flutter/material.dart';
import 'package:sams_book_list/constants.dart';

import '/models/book_model.dart';

class BookWidget extends StatelessWidget {
  final List<Book> books;

  const BookWidget({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: mediaWidth > 750 ? 2 : 1,
        ),
        itemBuilder: (context, index) {
          return SizedBox(
            width: mediaWidth,
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        books[index].rank,
                        style: headingStyle,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        books[index].title,
                        style: headingStyle,
                      ),
                    ],
                  ),
                  Text(
                    books[index].author,
                    style: bodyStyle,
                  ),
                  Image.asset(
                    books[index].coverImage,
                    fit: BoxFit.cover,
                    width: mediaWidth > 750 ? 200 : 100,
                    height: mediaWidth > 750 ? 300 : 150,
                  ),
                  Row(
                    children: [
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
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          );
        },
        itemCount: books.length,
      ),
    );
  }
}
