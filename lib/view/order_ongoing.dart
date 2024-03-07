import 'package:flutter/material.dart';
import 'package:flutter_caffeine/controller/provider/order_provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_caffeine/model/dto/get_order_dto.dart';
import 'package:flutter_caffeine/utils/constant.dart';

class OrderOngoing extends StatelessWidget {
  final String typeOrder;
  const OrderOngoing({super.key,required this.typeOrder});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('진행중인 주문'),
          const SizedBox(height: 10),
          FutureBuilder<OrderProvider>(
            future: getOrder(context, ['making','delivery'],typeOrder),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.black,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<Result> thisResult = snapshot.data!.result;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: thisResult.length,
                  itemBuilder: (context, index) {
                    final result = thisResult[index];
                    final chartOrders = result.chartOrders;
                    final displayedIds = <int>{};
                    return Column(
                      children: chartOrders.map((chartOrder) {
                        if (!displayedIds.contains(result.id)) {
                          displayedIds.add(result.id);
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(bottom: 10.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(
                                    0xFFE4E4E4)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 5),
                                        child: Text(
                                          cTextDate(DateTime.parse(
                                              result.createdAt)),
                                          style: cStyleTextDate,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, top: 5),
                                        child: Text(
                                          timeAgoString(DateTime.parse(
                                              result.createdAt)),
                                          style: cStyleTextDate,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text('주문번호 : ${thisResult[index].id}',style: cStyleTextDate,),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 65,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 5, right: 5),
                                          child: Image.network(chartOrder
                                              .cart.product.thumbnail),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 20),
                                          Text(
                                            chartOrder.cart.product.name,
                                            style: const TextStyle(
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                chartOrder.cart.cartOptional
                                                    .map((item) => item
                                                    .productOption.name)
                                                    .join(", "),
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(width: 5),
                                              if (chartOrder
                                                  .cart
                                                  .cartOptional
                                                  .isNotEmpty) ...[
                                                for (var optional
                                                in chartOrder
                                                    .cart.cartOptional)
                                                  Text(
                                                    optional.optionListCart
                                                        .map((item) => item
                                                        .productOptionList
                                                        .name)
                                                        .join("/"),
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                              ],
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          const SizedBox(width: 20),
                                          Center(
                                            child: Container(
                                              width: 175,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5.0,
                                                    bottom: 5,
                                                    left: 5,
                                                    right: 5),
                                                child: Text(
                                                  '승인',
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                      Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }).toList(),
                    );
                  },
                );
              } else {
                return const Text('Tidak ada data tersedia');
              }
            },
          )
        ],
      ),
    );
  }
}
