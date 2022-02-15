import 'dart:convert';

import 'package:appsimo/Models/UserModel.dart';
import 'package:http/http.dart' as http;

class PatientService {
  // api URL (FLASK API)
  final String API_URL = "http://127.0.0.1:5000/patients";

  // methode to get All Patients
  Future<List<UserModel>> getAllpatients() async {
    var response = await http.get(Uri.parse(API_URL));
    var jsonData = jsonDecode(response.body);
    List<UserModel> patients = [];
    if (response.statusCode == 200) {
      for (var u in jsonData) {
        UserModel pat = UserModel.fromJson(u);
        patients.add(pat);
      }
    } else {
      throw Exception("0 patient");
    }

    print(patients.length);
    return patients;
  }

  // add patient

  Future<bool> AddPatient(UserModel patient) async {
    var response = await http.post(Uri.parse(API_URL),
        body: jsonEncode(patient),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  // get Patient By Cin

  Future<UserModel?> getPatientByCIN(String cin) async {
    /* var response =
    await http.get(Uri.parse(API_URL + cin));
    var jsonData = jsonDecode(response.body);
    UserModel patient;
    if (response.statusCode == 200) {
      patient = UserModel.fromJson(jsonData);
    } else {
      throw Exception("Patient Not Found");
    }*/

    return null;
  }

  // edit Patient
  Future<bool> EditPatient(UserModel patient) async {
    // put reqiest to update Patient
    var response = await http.put(Uri.parse(API_URL),
        body: jsonEncode(patient),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> DeletePatientByCin(String cin) async {
    // put reqiest to update Patient
    var response = await http.delete(Uri.parse(API_URL + "/" + cin));
    // if status code == 204 deleted code 204 in rest api mean deleted
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }
}
