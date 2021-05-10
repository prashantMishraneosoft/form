import 'package:flutter/material.dart';
import 'file:///F:/stateNeosoft/registerationForm/lib/views/registerationScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Form',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Registrationscreen(),
    );
  }
}


