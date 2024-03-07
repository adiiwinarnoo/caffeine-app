import 'package:flutter/foundation.dart';
import 'package:flutter_caffeine/model/dto/get_order_dto.dart';

class LoginProvider with ChangeNotifier {
  bool _isChangedUsername = false;
  bool _isChangedPassword = false;
  bool _isLoading = false;
  String _username = '';
  String _password = '';
  String _tokenUser = '';

  List<Result> _result = [];

  List<Result> get result => _result;

  bool get isChangedUsername => _isChangedUsername;
  bool get isChangedPassword => _isChangedPassword;
  bool get isLoading => _isLoading;
  String get userName => _username;
  String get tokenUser => _tokenUser;
  String get password => _password;

  void setIsChangedUsername(bool value){
    _isChangedUsername = value;
    notifyListeners();
  }
  void setIsChangedPassword(bool value){
    _isChangedPassword = value;
    notifyListeners();
  }
  void setUsername(String value){
    _username = value;
    notifyListeners();
  }
  void setPassword(String value){
    _password = value;
    notifyListeners();
  }
  void setTokenUser(String value){
    _tokenUser = value;
    notifyListeners();
  }
  void setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }
  void setDataResult(List<Result> newResult){
    _result = newResult;
    notifyListeners();
  }
}