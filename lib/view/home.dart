import 'package:flutter/material.dart';
import 'package:flutter_caffeine/controller/network/get_order.dart';
import 'package:flutter_caffeine/model/dto/get_order_dto.dart';
import 'package:flutter_caffeine/view/component/app_bar.dart';
import 'package:flutter_caffeine/view/component/cScan.dart';
import 'package:flutter_caffeine/view/component/component_button_filter.dart';
import 'package:flutter_caffeine/view/new_order_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String idKey = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarCom(),
          SizedBox(height: 30),
          ButtonScann(),
          ComponentFilterButton(),
          Expanded(child: NewOrderScreen())
        ],
      )
    ));
  }
}
