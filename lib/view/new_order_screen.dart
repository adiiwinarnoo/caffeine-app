import 'package:flutter/material.dart';
import 'package:flutter_caffeine/controller/provider/filter_button_provider.dart';
import 'package:flutter_caffeine/controller/provider/order_provider.dart';
import 'package:flutter_caffeine/utils/constant.dart';
import 'package:flutter_caffeine/view/order_finished.dart';
import 'package:flutter_caffeine/view/order_new.dart';
import 'package:flutter_caffeine/view/order_ongoing.dart';
import 'package:flutter_caffeine/view/order_rejected.dart';
import 'package:provider/provider.dart';
import 'package:flutter_caffeine/model/dto/get_order_dto.dart';
import 'package:flutter_caffeine/controller/network/get_order.dart';
import 'package:flutter_caffeine/controller/provider/order_provider.dart';
import 'package:flutter_caffeine/controller/provider/login_provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    String orderString = Provider.of<FilterButtonProvider>(context).filterAll;
    String typeOrder = '';

    if(orderString.contains('pickup')){
      typeOrder = 'pickup';
    }else if (orderString.contains('all')){
      typeOrder = 'all';
    }else if (orderString.contains('delivery')) {
      typeOrder = 'delivery';
    }else if (orderString.contains('dinein')){
      typeOrder = 'dinein';
    }

    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  OrderNew(typeOrder: typeOrder,),
                  OrderOngoing(typeOrder: typeOrder),
                  OrderFinished(typeOrder: typeOrder),
                  OrderRejected(typeOrder: typeOrder),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
