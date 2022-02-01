import 'dart:convert';

import 'package:appsimo/Models/UserModel.dart';
import 'package:appsimo/Services/PatientService.dart';
import 'package:appsimo/locator.dart';
import 'package:appsimo/views/DeleteUser.dart';
import 'package:appsimo/views/UserOperations.dart';
import 'package:flutter/material.dart';


class UserList extends StatelessWidget {

   List<UserModel> listPatients = <UserModel>[];


  @override
  Widget build(BuildContext context) {

    locator.get<PatientService>().getAllpatients();
    return Scaffold(
      appBar:AppBar(title: Text('List Des Patients')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          locator.get<PatientService>().getAllpatients();
        Navigator.of(context).push(MaterialPageRoute(builder: (__)=> UserOperations(patientCin: 'create',)));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) =>Divider(height: 1,color: Colors.green),
        itemBuilder: (_, Index){
          return Dismissible(
            key: ValueKey(Index),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction){

            },
            confirmDismiss: (direction) async{
              final result = await showDialog(
                context: context,
                builder: (_) => DeleteUser()
              );
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(child: Icon(Icons.delete,color:  Colors.white,), alignment: Alignment.centerLeft,),
            ),
            child: ListTile(

              title: Text(
                listPatients[Index].dose1,
              style: TextStyle(color: Theme.of(context).primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
            ),
            subtitle: Text('ELYAZID'),
            onTap: (){

              //service.getAllpatients();
              Navigator.of(context).push(MaterialPageRoute(builder: (__)=> UserOperations(patientCin:'elya')));
            }
            ),
          );

        },
        itemCount: listPatients.length,
      ),
    );//scaffold
  }
}
