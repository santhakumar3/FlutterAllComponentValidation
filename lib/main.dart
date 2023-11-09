import 'package:all_widget_validation/form.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(const MyApp());
 } 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'All Component Validation',
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatelessWidget {
  const MyAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        
      ),
      body: MyForm(),
    );
  }
}