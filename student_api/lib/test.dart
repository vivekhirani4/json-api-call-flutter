import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class myclass extends StatefulWidget {
  const myclass({super.key});

  @override
  State<myclass> createState() => _myclassState();
}

class _myclassState extends State<myclass> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getvalue();
  }


  void _getvalue() async {
    SharedPreferences srf = await SharedPreferences.getInstance();
    var st_id = await srf.getString('st_id');
    print(st_id);

final queryParameters = {
  'st_id': st_id,
};
    var url = Uri.https('akashsir.in','/myapi/crud/student-detail-api.php',queryParameters);
    print(url);
    var response = await http.get(url);
    print('response body : ${response.body}');


   var myjosn = json.decode(response.body);
  
    print(myjosn['st_name']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('heloo')),
    );
  }
}