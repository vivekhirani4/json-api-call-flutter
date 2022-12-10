import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Update_Details extends StatefulWidget {
  const Update_Details({
    super.key,
  });

  @override
  State<Update_Details> createState() => _Update_DetailsState();
}

class _Update_DetailsState extends State<Update_Details> {
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();

  var st_id;
  var mylist = [];
  Future? myfuture;
  var jsonmap;

  String? sname;
  String? sgender;
  String? semail;
  String? smobile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _getvalue();
  }

  void  _getvalue() async {
      SharedPreferences srf = await SharedPreferences.getInstance();
      var st_id = await srf.getString('st_id');
      print(st_id);

      final quary = {'st_id' : st_id};

      var url = Uri.https('akashsir.in','/myapi/crud/student-detail-api.php',quary);
      var response = await http.get(url);
      print('response code : ${response.statusCode}');
        print('response body of getvalue : ${response.body}');

      var jsondata = json.decode(response.body);
      // print(jsondata['st_name']);

      sname = jsondata['st_name'];
      print('name is = ${sname}');
      sgender = jsondata['st_gender'];
      semail = jsondata['st_email'];
      smobile = jsondata['st_mobileno'];
      

  }

  void _updatDetails() async {
    SharedPreferences srf = await SharedPreferences.getInstance();

    var st_id = await srf.getString('st_id');
    print(st_id);

    var url = Uri.https('akashsir.in', '/myapi/crud/student-edit-api.php');
    var response = await http.post(url, body: {
      'st_id': st_id,
      'st_name': name.text,
      'st_gender': gender.text,
      'st_email': email.text,
      'st_mobileno': mobile.text
    });
    print('response code : ${response.statusCode}');
    print('response body : ${response.body}');

    Map<String, dynamic> mymap = json.decode(response.body);

    var flag = mymap['flag'];
    print(flag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Details'),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13), 
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                ),
                child: Row(
                  children: const [
                    Text(
                      'Update Profile',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.edit),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: name,
                autofocus: false,
                initialValue: sname, // <-- SEE HERE
                decoration: InputDecoration(
                  hintText: 'update name',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: gender,
                autofocus: false,
                initialValue: sgender, // <-- SEE HERE
                decoration: InputDecoration(
                  hintText: 'update gender',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: email,
                autofocus: false,
                initialValue: semail, 
                decoration: InputDecoration(
                  hintText: 'Upadate gender',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: mobile,
                autofocus: false,
                initialValue: smobile, // <-- SEE HERE
                decoration: InputDecoration(
                  hintText: 'Update Number',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _updatDetails();
                  });
                },
                child: Text('Submit data'),
                style: ElevatedButton.styleFrom(primary: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
