import 'package:appsimo/Models/UserModel.dart';
import 'package:appsimo/Services/PatientService.dart';
import 'package:appsimo/locator.dart';
import 'package:appsimo/views/DeleteUser.dart';
import 'package:appsimo/views/UserOperations.dart';
import 'package:appsimo/views/patient_widget.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  // list patients
  List<UserModel>? listPatients;
  // pour la recuperation des patients
  void getPatients() {
    locator.get<PatientService>().getAllpatients().then((listP) => setState(() {
          listPatients = listP;
        }));
  }

  // null == ajouter ? value == modifier bute pourr screen
  void navigateToUserOptions(UserModel? patient) async {
    bool? isSuccessful = await Navigator.of(context).push(
        MaterialPageRoute(builder: (__) => UserOperations(patient: patient)));
    if (isSuccessful ?? false) getPatients();
  }

  @override
  Widget build(BuildContext context) {
    if (listPatients == null) getPatients();
    return Scaffold(
      appBar: AppBar(title: Text('List Des Patients')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          locator.get<PatientService>().getAllpatients();
          navigateToUserOptions(null);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              setState(() {
                listPatients?.removeAt(index);
              });
            },
            confirmDismiss: (direction) async {
              final result = await showDialog(
                  context: context,
                  builder: (_) => DeleteUser(
                        patient: listPatients![index],
                      ));
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => navigateToUserOptions(listPatients?[index]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
                // widget to display data
                child: PatientWidget(patient: listPatients![index]),
              ),
            ),
          );
        },
        itemCount: listPatients?.length ?? 0,
      ),
    ); //scaffold
  }
}
