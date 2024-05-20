import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DemoAnimate extends StatefulWidget {
  const DemoAnimate({super.key});

  @override
  State<DemoAnimate> createState() => _DemoAnimateState();
}

class _DemoAnimateState extends State<DemoAnimate> {
  final Set<int> _animatedIndices = {}; // Set to store animated indices

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: mediaHeight,
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            bool shouldAnimate = !_animatedIndices.contains(index);

            if (shouldAnimate) {
              _animatedIndices.add(index); // Add the index to the set
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  shouldAnimate // Only animate if the index is not in the set
                      ? Animate(
                          effects: const [
                            SlideEffect(
                              duration: Duration(seconds: 1),
                            ),
                            FadeEffect(
                              duration: Duration(seconds: 1),
                            ),
                          ],
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Animate(
                                    delay: const Duration(milliseconds: 500),
                                    effects: const [
                                      SlideEffect(
                                        duration: Duration(seconds: 1),
                                      ),
                                      FadeEffect(
                                        duration: Duration(seconds: 1),
                                      ),
                                    ],
                                    child: const Text(
                                      'Title',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Animate(
                                    delay: const Duration(milliseconds: 1000),
                                    effects: const [
                                      SlideEffect(
                                        duration: Duration(seconds: 1),
                                      ),
                                      FadeEffect(
                                        duration: Duration(seconds: 1),
                                      ),
                                    ],
                                    child: const Text(
                                      'Author',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Animate(
                                    delay: const Duration(milliseconds: 1500),
                                    effects: const [
                                      SlideEffect(
                                        duration: Duration(seconds: 1),
                                      ),
                                      FadeEffect(
                                        duration: Duration(seconds: 1),
                                      ),
                                    ],
                                    child: const Text(
                                      'Description',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Author',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Description',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
            );
          },
        ),
      ),
    );
  }
}
