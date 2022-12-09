import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Student_list extends StatefulWidget {
  const Student_list({super.key});

  @override
  State<Student_list> createState() => _Student_listState();
}

class _Student_listState extends State<Student_list> {
  Future? myfuture;
  var mylist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myfuture = _fetchdata();
  }

  Future<List> _fetchdata() async {
    var url = Uri.https('akashsir.in','/myapi/crud/student-list-api.php');
    print(url);
    var response = await http.get(url);
    print('response code = ${response.statusCode}');
    print('response body = ${response.body}');

    Map<String, dynamic> mymap = json.decode(response.body);
    mylist = mymap['student_list'];

    return mylist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: myfuture,
        builder: (context, snapshot) {
          // if(!snapshot.hasData)
          // {
          //   return Center(child: CircularProgressIndicator(),);
          // }
          // if(snapshot.hasError)
          // {
          //   return Center(child: Text('has error'),);
          // }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.network(snapshot.data[index]['st_photo']),
                  title: Text(snapshot.data[index]['st_name']),
                  subtitle: Text('${snapshot.data[index]['st_email']}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
