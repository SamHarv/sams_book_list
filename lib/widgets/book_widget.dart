import 'package:flutter/material.dart';

import '/constants.dart';
import '/models/book_model.dart';

class BookWidget extends StatefulWidget {
  final List<Book> books;

  const BookWidget({
    super.key,
    required this.books,
  });

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  late List<Book> _items;

  @override
  void initState() {
    super.initState();
    _items = widget.books;
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: mediaWidth,
      child: AnimatedList(
        shrinkWrap: true,
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
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
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 40,
                              child: Text(
                                _items[index].rank,
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
                                    _items[index].title,
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
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: Row(
                          children: [
                            gapW48,
                            SizedBox(
                              width: mediaWidth - 110,
                              child: Text(
                                _items[index].author,
                                style: bodyStyle,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                      ),
                      gapH16,
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: Row(
                          children: [
                            gapW48,
                            Image.asset(
                              _items[index].coverImage,
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
          );
        },
      ),
    );
  }
}
