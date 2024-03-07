import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_caffeine/model/dto/update_order_dtp.dart';
import 'package:flutter_caffeine/utils/constant.dart';
import 'package:flutter_caffeine/controller/provider/login_provider.dart';

class UpdateOrderApi {
  final LoginProvider loginProvider;

  final int? idProduct;
  final String? status;
  final String? reasonRejected;
  final int? estimatedTime;

  UpdateOrderApi({required this.loginProvider,this.idProduct, this.status, this.reasonRejected, this.estimatedTime});

  Future<UpdateOrderDTO> updateOrderRejected(
      int idProduct, String status, String reason) async {
      String tokenUser = loginProvider.tokenUser;

    try {
      final response = await http.patch(
        Uri.parse('$BASE_URL/order/company/update/$idProduct'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization' : 'Bearer $tokenUser'
        },
        body: jsonEncode(
            <String, String>{'status': status, 'description_rejected': reason}),
      );
      if (response.statusCode == 200){
        return UpdateOrderDTO.fromJson(jsonDecode(response.body));
      }else if (response.statusCode == 401){
        return UpdateOrderDTO(status: response.statusCode, message: 'Unauthorized', dataUpdateOrder: null);
      }else if (response.statusCode == 404) {
        return UpdateOrderDTO(status: response.statusCode, message: 'Not Found', dataUpdateOrder: null);
      }else{
        return UpdateOrderDTO(status: response.statusCode, message: 'Please Check Your Connection', dataUpdateOrder: null);
      }
    } catch (e) {
      print('update rejected error ${e.toString()}');
      return UpdateOrderDTO(status: 500, message: e.toString(), dataUpdateOrder: null);
    }
  }
}
