import 'package:flutter/material.dart';
import 'package:flutter_caffeine/controller/network/get_order.dart';
import 'package:flutter_caffeine/controller/provider/order_provider.dart';
import 'package:flutter_caffeine/utils/constant.dart';
import 'package:flutter_caffeine/view/qr_scan.dart';
import 'package:toast/toast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_caffeine/controller/provider/login_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ButtonScann extends StatelessWidget {
  const ButtonScann({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    void _onScanButtonPressed() async {
      PermissionStatus permissionStatus = await getCameraPermision();
      if (permissionStatus.isGranted) {
        Navigator.pushReplacementNamed(context, QrScanner.idKey);
      } else {
        print('gada izin');
      }
    }

    return TextButton(
      onPressed: (){
       _onScanButtonPressed();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(7)
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt,color: Colors.white,),
            SizedBox(width: 5),
            cStyleTxtScan,
          ],
        ),
      ),
    );
  }
}
