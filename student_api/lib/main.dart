import 'package:flutter/material.dart';
import 'package:student_api/login.dart';
import 'package:student_api/test.dart';


void main()
{ // await
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myclass(),
    );
  }
}
