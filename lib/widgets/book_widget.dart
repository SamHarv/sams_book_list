import 'package:flutter/material.dart';

import '/constants.dart';
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
      width: mediaWidth,
      child: Column(
        children: List.generate(
          books.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
              ),
              width: mediaWidth,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 40,
                          child: Text(
                            books[index].rank,
                            style: headingStyle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: mediaWidth - 96,
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
                      ],
                    ),
                    gapH16,
                    Row(
                      children: [
                        gapW48,
                        SizedBox(
                          width: mediaWidth - 110,
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
                        gapW48,
                        Image.asset(
                          books[index].coverImage,
                          fit: BoxFit.cover,
                          width: 200,
                        ),
                      ],
                    ),
                    gapH16,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
