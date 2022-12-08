import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {}, icon: Icon(Icons.notifications_none),),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text('This is home'),
        ),
      ),
    );
  }
}