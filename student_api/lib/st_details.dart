import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'change_password.dart';
import 'update_students_details.dart';

class St_detail extends StatefulWidget {
  final id;
  final name;
  final mobile;
  final email;
  final gender;

  const St_detail(
      {super.key,
      required this.id,
      required this.name,
      required this.email,
      required this.mobile,
      required this.gender
      });

  @override
  State<St_detail> createState() => _St_detailState();
}

class _St_detailState extends State<St_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students details'),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(13),
            child: Column(
              children: [
                const Icon(
                  Icons.person,
                  size: 200,
                ),
                // SizedBox(height: 20,),
                Divider(
                  color: Colors.grey.withOpacity(0.4),
                  height: 2,
                  thickness: 2,
                  indent: 1,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                      // color: Colors.grey,
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.email,
                  style: const TextStyle(
                      // color: Colors.grey,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '+91 ${widget.mobile}',
                  style: const TextStyle(
                      // color: Colors.grey,
                      fontSize: 20),
                ),

                const SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: 40,
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Update_Details(),
                          ),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      primary: Colors.grey.withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Edit profile',
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.edit,
                        color: Colors.black,)
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ChangePassword(),));
                      });
                    },
                    child: Text(
                      'Change passeword',
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
