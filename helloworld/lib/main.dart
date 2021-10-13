import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//basic widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text("My First App")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          HelloWorld(),
          HelloWorldPlus(10),
          HelloWorldPlus(100, color: Colors.blue),
          HelloWorldPlus(1000, color: Colors.black),
          HelloWorldGenerator(13)
        ],
      )),
    ));
  }
}

//widget with style
class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Hello World!!!",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}

//parametrized widget
class HelloWorldPlus extends StatelessWidget {
  final int number;
  final Color color;

  const HelloWorldPlus(this.number, {this.color = Colors.red, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello World $number",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: color),
    );
  }
}

//widget with multiple children
class HelloWorldGenerator extends StatelessWidget {
  final int count;
  final Color color;

  const HelloWorldGenerator(this.count, {this.color = Colors.green, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenList = [];
    for (int i = 0; i < count; i++) {
      childrenList.add(HelloWorldPlus(i + 1,
          color:
              Color.fromRGBO(16 * i % 255, 32 * i % 255, 64 * i % 255, 1.0)));
    }
    return Column(children: childrenList);
  }
}
