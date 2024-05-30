import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '/constants.dart';
import '/models/book_model.dart';

class BookWidget extends StatefulWidget {
  final List<Book> books;
  final ScrollController scrollController;

  const BookWidget({
    super.key,
    required this.books,
    required this.scrollController,
  });

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: mediaWidth > 800 ? mediaWidth / 2 : mediaWidth,
      child: Column(
        children: AnimateList(
          children: [
            for (int i = 0; i < widget.books.length; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  width: mediaWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Animate(
                          adapter: ScrollAdapter(
                            widget.scrollController,
                            begin: mediaHeight / 5,
                            end: mediaHeight / 2,
                            direction: Direction.forward,
                          ),
                          effects: const [
                            SlideEffect(
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn,
                            ),
                            FadeEffect(
                              duration: Duration(seconds: 1),
                            ),
                          ],
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 40,
                                child: Text(
                                  widget.books[i].rank,
                                  style: headingStyle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  width: mediaWidth > 800
                                      ? mediaWidth / 2 - 96
                                      : mediaWidth - 96,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      widget.books[i].title,
                                      style: headingStyle,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        gapH16,
                        Animate(
                          adapter: ScrollAdapter(
                            widget.scrollController,
                            begin: mediaHeight / 2,
                            end: (mediaHeight / 5) * 3,
                            direction: Direction.forward,
                          ),
                          effects: const [
                            SlideEffect(
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn,
                            ),
                            FadeEffect(
                              duration: Duration(seconds: 1),
                            ),
                          ],
                          child: Row(
                            children: [
                              gapW48,
                              SizedBox(
                                width: mediaWidth > 800
                                    ? mediaWidth / 2 - 110
                                    : mediaWidth - 110,
                                child: Text(
                                  widget.books[i].author,
                                  style: bodyStyle,
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                        ),
                        gapH16,
                        Animate(
                          adapter: ScrollAdapter(
                            widget.scrollController,
                            begin: (mediaHeight / 5) * 3,
                            end: (mediaHeight / 6) * 5,
                            direction: Direction.forward,
                          ),
                          effects: const [
                            SlideEffect(
                              duration: Duration(seconds: 5),
                              curve: Curves.easeIn,
                            ),
                            FadeEffect(
                              duration: Duration(seconds: 1),
                            ),
                          ],
                          child: Row(
                            children: [
                              gapW48,
                              Image.asset(
                                widget.books[i].coverImage,
                                fit: BoxFit.cover,
                                width: 200,
                              ),
                            ],
                          ),
                        ),
                        gapH16,
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
