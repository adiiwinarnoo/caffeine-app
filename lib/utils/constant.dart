import 'package:flutter/material.dart';
import 'package:flutter_caffeine/controller/provider/order_provider.dart';
import 'package:flutter_caffeine/controller/network/get_order.dart';
import 'package:flutter_caffeine/controller/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_caffeine/model/dto/get_order_dto.dart';
import 'package:permission_handler/permission_handler.dart';

String BASE_URL = 'http://13.209.138.248:5000/api';

const cGreyColorButton = Color(0xFFD0D0D0);

const cTextFieldLogin = InputDecoration(
  hintStyle: TextStyle(color: Colors.black12),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black12, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black12, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  fillColor: Colors.black12,
  filled: true,
);

const cTextButtonLogin= Text('로그인',
    style: TextStyle(
      color: Colors.white, // Warna teks untuk tombol
      fontSize: 18, // Ukuran font untuk teks tombol
    ));

var cBgButtonLogin = BoxDecoration(
  color: Colors.black, // Warna latar belakang sesuai dengan fillColor
  borderRadius: BorderRadius.circular(10.0), // Mengatur sudut bulatan
);

const cImageBannerLogin = Image(
  image: AssetImage('assets/images/ic_app.png'),
  width: 170,
  height: 200,
  fit: BoxFit.fill,
);

const cTextBelowBannerLogin =
    Text('환영합니다, 점주님!', style: TextStyle(color: Colors.white, fontSize: 24));

const cTextLogin =
    Text('Login', style: TextStyle(color: Colors.black, fontSize: 18));
const cHintLogin = Text('매장명',
    style: TextStyle(
      fontSize: 18,
      color: Colors.black,
    ));
const cHintPW = Text('PW', style: TextStyle(fontSize: 18, color: Colors.black,));

const cStyleTxtScan = Text('상품코드스캔',style: TextStyle(color: Colors.white),);

const cStyleTextDate = TextStyle(color: Colors.grey, fontSize: 12);

String timeAgoString(DateTime dateTime) {
  final Duration timeAgo = DateTime.now().difference(dateTime);
  if (timeAgo.inSeconds < 60) {
    return '방금 전';
  } else if (timeAgo.inMinutes < 60) {
    return '${timeAgo.inMinutes}분 전';
  } else if (timeAgo.inHours < 24) {
    return '${timeAgo.inHours}시간 전';
  } else if (timeAgo.inDays < 30) {
    return '${timeAgo.inDays}일 전';
  } else if (timeAgo.inDays < 365) {
    return '${(timeAgo.inDays / 30).floor()}달 전';
  } else {
    return '${(timeAgo.inDays / 365).floor()}년 전';
  }
}

String cTextDate(DateTime dateTime){
  return  '주문일시 : ${dateTime.year}년 ${dateTime.month}월 ${dateTime.day}일 ${dateTime.hour}시 ${dateTime.minute}분';
}

Future<OrderProvider> getOrder(BuildContext context, List<String> status,
    String typOrder) async {
  List<Result> listResult = [];
  var value = await getOrderApi(
    loginProvider: Provider.of<LoginProvider>(context, listen: false),
  ).getOrder(typOrder);
  for (final i in value.data!.result){
    if(status.contains(i.status)){
      listResult.add(i);
    }
  }
  return OrderProvider()..setDataResult(listResult);
}

Future<PermissionStatus> getCameraPermision() async {
  var status = await Permission.camera.status;
  if (!status.isGranted) {
    final result = await Permission.camera.request();
    return result;
  } else {
    return status;
  }
}
