import 'package:flutter/material.dart';
class DeleteUser extends StatelessWidget {
  const DeleteUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('warning'),
      content: Text('voulez vous supprimer le patient ?'),
      actions: <Widget>[
        FlatButton(
        child: Text('Oui'),
          onPressed: (){
          // delete user using api
          Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text('Non'),
          onPressed: (){
            Navigator.of(context).pop(false);
          },
        )
      ],
    );
  }
}
