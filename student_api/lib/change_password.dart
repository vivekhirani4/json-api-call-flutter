import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController opass = TextEditingController();
  TextEditingController npass = TextEditingController();
  TextEditingController cpass = TextEditingController();

  void _changePassword() async {
    SharedPreferences shrf = await SharedPreferences.getInstance();
    var opassword = shrf.getString('pass');
    var npassword = npass.text;
    var cpassword = cpass.text;

    if (npassword.compareTo(cpassword) == 0) {
      if (opassword?.compareTo(opass.text) == 0) {
        SharedPreferences srf = await SharedPreferences.getInstance();
        var st_id = await srf.getString('st_id');
        print(st_id);

        var url = Uri.https('akashsir.in', '/myapi/crud/student-change-password-api.php');
        var response = await http.post(url, body: {
          'st_id': st_id,
          'opass': opassword,
          'npass': npassword,
          'cpass': cpassword
        });
        print('response code : ${response.statusCode}');
        print('response body : ${response.body}');

        Map<String, dynamic> mymap = json.decode(response.body);

        var value = mymap['flag'];
        int flag = int.parse(value);
        print('Flag = ${flag}');
      }
      else{
        print('The old password was not corrent');
      }

    }
    else{
      print('Password doesn\'t match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Change password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 35, left: 4),
              child: const Text(
                'Change Password.!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: opass,
              decoration: const InputDecoration(
                  fillColor: Colors.grey, hintText: 'Enter current password'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: npass,
              decoration: const InputDecoration(
                  hintText: 'Enter new password', fillColor: Colors.grey),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: cpass,
              decoration: const InputDecoration(
                  hintText: 'Re-enter new password', fillColor: Colors.grey),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _changePassword();
                });
              },
              child: Text('Update password'),
              style: ElevatedButton.styleFrom(primary: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
