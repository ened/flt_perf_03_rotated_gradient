import 'package:flutter/material.dart';

import 'my_button.dart';

void main() => runApp(MyApp());

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
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GradientRotation')
      ),
      backgroundColor: Color(0xFF001228),
      body: ListView(
        children: List.generate(
          64,
          (index) => Container(
            height: 56,
            child: Center(
              child: MyButton(
                title: 'Button: $index',
                style: index % 2 == 0
                    ? MyButtonStyle.primary
                    : MyButtonStyle.secondary,
                onPressed: () {
                  //
                },
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }
}
