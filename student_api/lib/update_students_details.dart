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

  

  void _updatDetails () async{

    SharedPreferences srf = await SharedPreferences.getInstance();

    int? st_id = await srf.getInt('st_id');
    print(st_id);

    var url = Uri.https('akashsir.in', '/myapi/crud/student-edit-api.php');
    var response = await http
        .post(url, body: {
          'st_id':  st_id,
          'st_name' : name.text,
          'st_gender' : gender.text,
          'st_mobileno' : mobile.text});
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
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30,),
                child: Row(
                  children: const [
                    Text(
                      'Update Profile',
                      style: TextStyle(
                        fontSize: 25,
                      ),
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
              TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Update Name'
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: gender,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Update gender'
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Update email'
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: mobile,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Update number'
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
                )
            ],
          ),
        ),
      ),
    );
  }
}
