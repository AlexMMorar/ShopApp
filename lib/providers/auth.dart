import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth extends ChangeNotifier {
  var _token;
  var _expiryDate;
  var _userId;

//https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY]
//api key = AIzaSyDl2Vlg506PbNE-5cK2YK_5d8K2dVFqeQI
  Future<void> signup(String email, String passowrd) async {
    final response = await http.post(
      Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDl2Vlg506PbNE-5cK2YK_5d8K2dVFqeQI'),
      body: json.encode(
        {
          'email': email,
          'password': passowrd,
          'returnSecureToken': true,
        },
      ),
    );
    print(response.body);
  }
}
