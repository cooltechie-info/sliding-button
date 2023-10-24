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
          label: 'Slide to Confirm',
          shadow: const BoxShadow(color: Colors.transparent),
          action: () {},
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    ));

    expect(find.byType(SlidingButton), findsOneWidget);
  });
}
