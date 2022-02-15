import 'package:appsimo/Models/UserModel.dart';
import 'package:appsimo/Services/PatientService.dart';
import 'package:appsimo/locator.dart';
import 'package:flutter/material.dart';

class UserOperations extends StatefulWidget {
  //UserOperations({Key? key}) : super(key: key);
  final UserModel? patient;
  UserOperations({Key? key, this.patient});

  @override
  State<StatefulWidget> createState() => _UserOperationsState();
}

class _UserOperationsState extends State<UserOperations> {
  bool dose1 = false;
  bool dose2 = false;
  bool dose3 = false;
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _cinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.patient != null) {
      _firstnameController.text = widget.patient?.firstname ?? "";
      _lastnameController.text = widget.patient?.lastname ?? "";
      _cinController.text = widget.patient?.cin ?? "";
      dose1 = widget.patient?.dose1 == "true";
      dose2 = widget.patient?.dose2 == "true";
      dose3 = widget.patient?.dose3 == "true";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.patient == null
              ? 'Creer un Nouveau Patient'
              : 'Modifier un Nouveau Patient')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Nom'),
              controller: _lastnameController,
            ),
            Container(height: 8),
            TextField(
              decoration: InputDecoration(hintText: 'Prenom'),
              controller: _firstnameController,
            ),
            Container(height: 8),
            TextField(
              decoration: InputDecoration(hintText: 'CIN'),
              controller: _cinController,
            ),
            Container(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("Dose 1"),
                    Checkbox(
                        value: dose1,
                        onChanged: (v) {
                          setState(() {
                            dose1 = v ?? false;
                          });
                        }),
                  ],
                ),
                Column(
                  children: [
                    Text("Dose 2"),
                    Checkbox(
                        value: dose2,
                        onChanged: (v) {
                          setState(() {
                            dose2 = v ?? false;
                          });
                        }),
                  ],
                ),
                Column(
                  children: [
                    Text("Dose 3"),
                    Checkbox(
                        value: dose3,
                        onChanged: (v) {
                          setState(() {
                            dose3 = v ?? false;
                          });
                        }),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 30.0,
              child: RaisedButton(
                child: Text(
                  'Ajouter',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if (widget.patient != null) {
                    // update patient using FLASK api
                    locator
                        .get<PatientService>()
                        .EditPatient(UserModel(
                          widget.patient?.id ?? 0,
                          _firstnameController.text,
                          _lastnameController.text,
                          _cinController.text,
                          dose1.toString(),
                          dose2.toString(),
                          dose3.toString(),
                        ))
                        .then((isSuccessful) =>
                            Navigator.of(context).pop(isSuccessful));
                  } else {
                    // add patient using FLASK api
                    locator
                        .get<PatientService>()
                        .AddPatient(UserModel(
                          0,
                          _firstnameController.text,
                          _lastnameController.text,
                          _cinController.text,
                          dose1.toString(),
                          dose2.toString(),
                          dose3.toString(),
                        ))
                        .then((isSuccessful) =>
                            Navigator.of(context).pop(isSuccessful));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
