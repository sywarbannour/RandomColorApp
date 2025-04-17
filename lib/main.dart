import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Color App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const StateManagementApp(
        title: 'Random Color App',
        color: Colors.indigo,
      ),
    );
  }
}

class StateManagementApp extends StatefulWidget {
  const StateManagementApp({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  State<StateManagementApp> createState() => _StateManagementAppState();
}

class _StateManagementAppState extends State<StateManagementApp> {
  Color _currentColor = Colors.indigo;
  int _red = 0;
  int _green = 0;
  int _blue = 0;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.color;
    _red = _currentColor.red;
    _green = _currentColor.green;
    _blue = _currentColor.blue;
  }

  void _changeColor() {
    setState(() {
      _red = Random.secure().nextInt(256);
      _green = Random.secure().nextInt(256);
      _blue = Random.secure().nextInt(256);
      _currentColor = Color.fromRGBO(_red, _green, _blue, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: _currentColor, title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This color displayed is:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.13,
              color: _currentColor,
              child: Center(
                child: Text(
                  'R($_red) G($_green) B($_blue)',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeColor,
        tooltip: 'Change Color',
        backgroundColor: _currentColor,
        child: const Icon(Icons.palette),
      ),
    );
  }
}
