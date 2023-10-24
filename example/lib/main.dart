import 'package:flutter/material.dart';
import 'package:sliding_button/sliding_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SlidingButton(
              width: 400,
              height: 60,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              iconColor: Colors.blue,
              text: 'Slide to Confirm',
              sliderButtonContent: const Icon(Icons.arrow_forward_ios),
              shadow: const BoxShadow(color: Colors.transparent),
              onConfirmation: () {},
            )
          ],
        ),
      ),
    );
  }
}
