import 'package:flutter/material.dart';
import 'package:flutter_caffeine/controller/network/login_api.dart';
import 'package:flutter_caffeine/controller/provider/login_provider.dart';
import 'package:flutter_caffeine/utils/constant.dart';
import 'package:flutter_caffeine/view/home.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  static String idKey = 'loginScreen';

  @override
  Widget build(BuildContext context) {
    bool isChangedUsername = Provider.of<LoginProvider>(context).isChangedUsername;
    bool isChangedPassword = Provider.of<LoginProvider>(context).isChangedPassword;
    bool isLoading = Provider.of<LoginProvider>(context).isLoading;
    String username = Provider.of<LoginProvider>(context).userName;
    String password = Provider.of<LoginProvider>(context).password;

    ToastContext().init(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 55),
                  child: Column(
                    children: [cImageBannerLogin, cTextBelowBannerLogin],
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20.0, top: 20),
                                child: cTextLogin,
                              ),
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 40.0, left: 20.0),
                              child: cHintLogin),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, bottom: 20.0, right: 20),
                            child: TextField(
                              decoration: cTextFieldLogin,
                              onChanged: (value) {
                                  Provider.of<LoginProvider>(context,listen: false).setIsChangedUsername(true);
                                  Provider.of<LoginProvider>(context,listen: false).setUsername(value);
                              },
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: cHintPW),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, bottom: 10.0, right: 20),
                            child: TextField(
                              obscureText: true,
                              decoration: cTextFieldLogin,
                              onChanged: (value) {
                                Provider.of<LoginProvider>(context,listen: false).setIsChangedPassword(true);
                                Provider.of<LoginProvider>(context,listen: false).setPassword(value);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Container(
                          width: double.infinity, // Mengisi lebar layar
                          height: 50, // Mengatur tinggi tombol
                          decoration: BoxDecoration(
                            color: isChangedUsername && isChangedPassword ? Colors.black: Colors.grey,
                            // Warna latar belakang sesuai dengan fillColor
                            borderRadius: BorderRadius.circular(
                                10.0), // Mengatur sudut bulatan
                          ),
                          child: TextButton(
                            onPressed: (isChangedUsername && isChangedPassword) ? () {
                              Provider.of<LoginProvider>(context,listen: false).setLoading(true);
                              LoginApi(username: username,password: password).login().then((value) {
                                if (value.status == 200){
                                  Navigator.pushReplacementNamed(context, HomeScreen.idKey);
                                  Provider.of<LoginProvider>(context,listen: false).setTokenUser(value.token);
                                  Provider.of<LoginProvider>(context,listen: false).setLoading(false);
                                }else if (value.status == 401){
                                  Toast.show('UnAuthorized');
                                  Provider.of<LoginProvider>(context,listen: false).setLoading(false);
                                }else if (value.status == 404){
                                  Toast.show('Wrong Password!');
                                  Provider.of<LoginProvider>(context,listen: false).setLoading(false);
                                }else{
                                  Toast.show('Please Check your connection!');
                                  Provider.of<LoginProvider>(context,listen: false).setLoading(false);
                                }
                              });
                            } : null,
                            child: Text(
                              '로그인',
                              style: TextStyle(
                                color: isChangedUsername && isChangedPassword? Colors.white : Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
