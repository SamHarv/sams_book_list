import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DemoAnimate extends StatefulWidget {
  const DemoAnimate({super.key});

  @override
  State<DemoAnimate> createState() => _DemoAnimateState();
}

class _DemoAnimateState extends State<DemoAnimate> {
  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: mediaHeight,
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Animate(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
