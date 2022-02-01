import 'package:flutter/material.dart';

class UserOperations extends StatelessWidget {
  //UserOperations({Key? key}) : super(key: key);

   String patientCin;
    UserOperations({required this.patientCin});

    bool get isEditing =>patientCin !='create';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( patientCin == 'create'? 'Creer un Nouveau Patient': 'Modifier un Nouveau Patient' )),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Nom'
              ),
            ),
            Container(height: 8),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Prenom'
              ),
            ),
            Container(height: 8),
            TextField(
              decoration: InputDecoration(
                  hintText: 'CIN'
              ),
            ),
            Container(height: 8),
            SizedBox(
              width: double.infinity,
              height: 30.0,
              child: RaisedButton(
                child: Text('Ajouter', style: TextStyle(color: Colors.white),),

                color: Theme.of(context).primaryColor,
                onPressed: (){
                  if(isEditing){
                    // update patient using FLASK api
                  } else{
                    // create patient using Flask Api
                  }
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
