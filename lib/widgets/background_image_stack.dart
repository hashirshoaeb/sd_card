import 'package:flutter/material.dart';

class ImageStackBody extends StatelessWidget {
  final Widget child;

  ImageStackBody({this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            Spacer(flex: 10),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    // flex: 10,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/123.png'),
                    ),
                  ),
                  // SizedBox(height: 200),
                  Expanded(
                    // flex: 12,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/hhl.png'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        if (child != null) child,
      ],
    );
  }
}
