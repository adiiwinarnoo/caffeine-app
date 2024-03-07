import 'package:flutter/material.dart';
import 'package:flutter_caffeine/controller/provider/reason_rejected_list.dart';
import 'package:flutter_caffeine/utils/constant.dart';
import 'package:flutter_caffeine/view/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_caffeine/controller/network/update_order_api.dart';
import 'package:flutter_caffeine/controller/provider/login_provider.dart';
import 'package:toast/toast.dart';
import 'package:flutter_caffeine/controller/provider/filter_button_provider.dart';


class PopupRejected extends StatelessWidget {
  final int idProduct;
  const PopupRejected({Key? key,required this.idProduct});

  @override
  Widget build(BuildContext context) {
    bool isChanged = Provider.of<ReasonRejected>(context).statusText;
    String textReason = Provider.of<ReasonRejected>(context).reasonText;

    ToastContext().init(context);

    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      content: Builder(builder: (context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return Container(
          width: width - 20,
          height: height - 480,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '주문 취소 사유',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Provider.of<ReasonRejected>(context, listen: false)
                            .resetValue();
                        Provider.of<ReasonRejected>(context,listen: false).setChanged(false);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Consumer<ReasonRejected>(
                builder: (context, dataReason, _) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return ListTile(
                        dense: true,
                        visualDensity:
                        VisualDensity(horizontal: -4, vertical: -4),
                        contentPadding:
                        EdgeInsets.only(left: 0.0, right: 0.0),
                        leading: Checkbox(
                          value: dataReason.reasonValue[index],
                          onChanged: (value) {
                            dataReason.updateValue(index, value!);
                            textReason = dataReason.reasonList[index];
                            Provider.of<ReasonRejected>(context,listen: false).setTextReason(textReason);
                            print('checbox get string $textReason');
                          },
                        ),
                        title: Text(dataReason.reasonList[index]),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: cGreyColorButton,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      textReason = value;
                      Provider.of<ReasonRejected>(context,listen: false).setChanged(true);
                      Provider.of<ReasonRejected>(context,listen: false).setTextReason(value);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: (isChanged || textReason.isNotEmpty) ? (){
                    UpdateOrderApi(loginProvider: Provider.of<LoginProvider>(context, listen: false)).updateOrderRejected(idProduct, 'rejected', textReason).then((value){
                      if (value.status == 200){
                        Navigator.pop(context);
                        Provider.of<FilterButtonProvider>(context,listen: false).setTypeFilter('');
                      }else {
                        Toast.show('Your Response ${value.status}');
                      }
                    });
                  } : null,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isChanged || textReason.isNotEmpty ? Colors.black : Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 30, right: 30),
                      child: Text(
                        '확인',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      }),
    );
  }
}
