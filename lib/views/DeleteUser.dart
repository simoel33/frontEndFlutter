import 'package:appsimo/Models/UserModel.dart';
import 'package:appsimo/Services/PatientService.dart';
import 'package:appsimo/locator.dart';
import 'package:flutter/material.dart';

class DeleteUser extends StatelessWidget {
  final UserModel patient;
  const DeleteUser({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('warning'),
      content: Text('voulez vous supprimer le patient ?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Oui'),
          onPressed: () {
            // delete user using api
            locator.get<PatientService>().DeletePatientByCin(patient.cin).then((isSuccessful) =>
              Navigator.of(context).pop(isSuccessful)
            );

          },
        ),
        FlatButton(
          child: Text('Non'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        )
      ],
    );
  }
}
