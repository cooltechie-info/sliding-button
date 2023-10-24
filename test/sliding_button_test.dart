import 'package:flutter_test/flutter_test.dart';

import 'package:sliding_button/sliding_button.dart';

import 'package:flutter/material.dart';

void main() {
  testWidgets('Run test', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SlidingButton(
          width: 400,
          height: 60,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          iconColor: Colors.blue,
          text: 'Slide to Confirm',
          sliderButtonContent: const Icon(Icons.arrow_forward_ios),
          shadow: const BoxShadow(color: Colors.transparent),
          onConfirmation: () {},
        ),
      ),
    ));

    expect(find.byType(SlidingButton), findsOneWidget);
  });
}
