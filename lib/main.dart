import 'package:flutter/material.dart';
import 'package:flutter_caffeine/controller/provider/filter_button_provider.dart';
import 'package:flutter_caffeine/controller/provider/login_provider.dart';
import 'package:flutter_caffeine/controller/provider/order_provider.dart';
import 'package:flutter_caffeine/controller/provider/reason_rejected_list.dart';
import 'package:flutter_caffeine/view/home.dart';
import 'package:flutter_caffeine/view/login.dart';
import 'package:flutter_caffeine/view/qr_scan.dart';
import 'package:flutter_caffeine/view/splash.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => FilterButtonProvider()),
        ChangeNotifierProvider(create: (context) => ReasonRejected()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.idKey,
        routes: {
          SplashScreen.idKey : (context) => SplashScreen(),
          LoginScreen.idKey : (context) => LoginScreen(),
          HomeScreen.idKey : (context) => HomeScreen(),
          QrScanner.idKey : (context) => QrScanner(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
