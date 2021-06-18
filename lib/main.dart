import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var opened = [
    for (int i = 0; i < 9; i++)
      [
        for (int j = 0; j < 9; j++) false,
      ]
  ];

  String makeText(int i, int j) {
    if (i == 0 && j == 0) return '\\';
    if (i * j == 0) return max(i, j).toString();
    return '${i * j}';
  }

  void changeOpened(int i, int j) {
    if (i == 0 || j == 0) return;
    setState(() {
      opened[i - 1][j - 1] = !opened[i - 1][j - 1];
    });
  }

  bool isOpened(int i, int j) {
    if (i == 0 || j == 0) return true;
    return opened[i - 1][j - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            for (int i = 0; i < 10; i++)
              Expanded(
                child: Row(
                  children: [
                    for (int j = 0; j < 10; j++)
                      Expanded(
                        child: GestureDetector(
                          onTap: () => changeOpened(i, j),
                          child: CardWidget(
                            isOpened(i, j) ? makeText(i, j) : '',
                            color:
                                (i == 0 || j == 0) ? Colors.blue : Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  CardWidget(this._text, {this.color});

  final String _text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: color,
      child: Center(
        child: Text(_text),
      ),
    );
  }
}
