import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/dto/login_dto.dart';
import 'package:flutter_caffeine/utils/constant.dart';

class LoginApi {

  final String username;
  final String password;

  LoginApi({required this.username, required this.password});

  Future<LoginDTO> login() async {
    print('$BASE_URL/login');
    try {
      final response = await http.post(
        Uri.parse('$BASE_URL/company/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'account_id': username,
          'account_pwd': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return LoginDTO.fromJson(jsonDecode(response.body));

      } else if (response.statusCode == 401) {
        return LoginDTO(status: response.statusCode, message: "UnAuthorized", token: "",userData: null);
      } else {
        return LoginDTO(status: response.statusCode, message: "please check your password", token: "",userData: null);
      }
    } catch (error) {
      print(error.toString());
      return LoginDTO(status: 500, message: error.toString(), token: "",userData: null);
    }
  }
}
