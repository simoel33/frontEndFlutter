import 'package:appsimo/Models/UserModel.dart';
import 'package:flutter/material.dart';

class PatientWidget extends StatelessWidget {
  UserModel patient;
  PatientWidget({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${patient.firstname} ${patient.lastname}",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Text("${patient.cin}"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${patient.dose1}"),
            Text("${patient.dose2}"),
            Text("${patient.dose3}"),
          ],
        ),
      ],
    );
  }
}
