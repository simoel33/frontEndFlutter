import 'package:appsimo/Services/PatientService.dart';
import 'package:appsimo/locator.dart';
import 'package:appsimo/views/user_list.dart';
import 'package:flutter/material.dart';

void main(){
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Passe Vaccinal App',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: UserList(),
    );
  }
  
}




