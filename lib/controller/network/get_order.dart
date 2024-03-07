import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_caffeine/controller/provider/login_provider.dart';
import 'package:http/http.dart' as http;

import '../../model/dto/get_order_dto.dart';
import 'package:flutter_caffeine/utils/constant.dart';
import 'package:provider/provider.dart';

class getOrderApi {
  final LoginProvider loginProvider;

  getOrderApi({required this.loginProvider});

  Future<OrderDTO> getOrder(String typeOrder) async {
    String tokenUser = loginProvider.tokenUser;
    print(tokenUser);
    final Uri uri =
        Uri.parse('$BASE_URL/order/company/my'); // Ganti BASE_URL dengan URL yang benar
    final Uri finalUri = uri.replace(queryParameters: {
      'type_order': typeOrder,
    });
    try {
      final response = await http.get(finalUri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization' : 'Bearer $tokenUser'
        },
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        final responseData = json.decode(response.body);
        return OrderDTO.fromJson(jsonDecode(response.body));
      } else {
        print(response.statusCode);
        return OrderDTO(status: 404, message: 'error one', data: null);
      }
    } catch (e) {
      print(e.toString());
      return OrderDTO(status: 500, message: 'error', data: null);
    }
  }
}
