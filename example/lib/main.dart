import 'package:example/inc/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttermodaldropdown/fluttermodaldropdown.dart';

import 'inc/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        items: const [
          {'ID': 1, 'DISPLAY_NAME': 'Test One'},
          {'ID': 2, 'DISPLAY_NAME': 'Two'},
          {'ID': 3, 'DISPLAY_NAME': 'Three'},
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  List<Map<String, dynamic>> items;

  @override
  State<MyHomePage> createState() => MainPageState();
}

class MainPageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  onTapValue(value) {
    print('agya ===> $value');
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CustomModalDropDown(
            items: widget.items,
            placeholder: 'Test',
            title: 'Hello',
            context: context,
            onChangeValue: onTapValue),
      ),
    );
  }
}
