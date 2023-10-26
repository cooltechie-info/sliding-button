[![pub package](https://img.shields.io/badge/pub-0.0.4-blue.svg)](https://pub.dev/packages/sliding_widget)

A sliding Flutter widget, which helps to start an event based on user interaction. Highly customizable and flexible.

## Features

- Highly customizable
- Easy to use

## Getting started

1. Add the dependency.

```yml
sliding_widget: ^0.0.4
```

2. Import the package.

```Dart
 import 'package:sliding_widget/sliding_widget.dart';
```

3. Use the widget in your code.

```Dart
 SlidingWidget(
          width: 350,
          height: 60,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          iconColor: Colors.blue,

          /// Text to be displayed inside the button.
          text: 'Slide to proceed',

          shadow: const BoxShadow(color: Colors.transparent),

          /// Accepts function, default is null, this property is required.
          action: () {},

          child: const Icon(Icons.arrow_forward_ios),
          
          /// Whether the icon to be fixed at the end.
          stickToEnd: false,
        ) 
```

## Usage

**This full code is from the example folder. You can run the example to see.**

```dart
import 'package:flutter/material.dart';
import 'package:sliding_widget/sliding_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            SlidingWidget(
              width: 350,
              height: 60,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              iconColor: Colors.blue,
              text: 'Slide to proceed',
              shadow: const BoxShadow(color: Colors.transparent),
              action: () {},
              child: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
```

## Custom Usage
There are several options that allows for more control:

|  Properties  |   Default   |   Description   |
|--------------|-----------------|--------------|
| `height` | null ?? 70 | Gives a height to a widget |
| `width` | null ?? 300 | Gives a width to a widget |
| `backgroundColor` | Colors.white | Gives a background color to a widget |
| `backgroundColorEnd` | null | Gives a background color to a widget while dragged |
| `foregroundColor` | Colors.blueAccent | Gives a color to a slider button |
| `label` | Slide to proceed | A text widget which assigns a label |
| `labelStyle` | Colors.white70, FontWeight.bold | Assigns label TextStyle |
| `shadow` | Colors.black38, Offset(0, 2), blurRadius: 2 | Gives a shadow to a slider button |
| `stickToEnd` | false | Make it true if the Icon need to be placed in the end position |
| `action` | null | (required) Define an action after sliding a button |
| `child` | Icons.chevron_right | For more customizable button add your own widget |
| `foregroundShape` | BorderRadius.all(Radius.circular(widget.height / 2)) | Gives shape to the child widget through BorderRadius |
| `backgroundShape` | BorderRadius.all(Radius.circular(widget.height)) | Gives shape to the background widget through BorderRadius |
| `onTapDown` | null | Add action when user interacts with the widget |
| `onTapUp` | null | Add action when user interacts with the widget |

<br>
<br>
