import 'package:flutter/foundation.dart';
import 'package:flutter_caffeine/model/dto/get_order_dto.dart';

class OrderProvider with ChangeNotifier {
  List<Result> _result = [];
  List<Result> _resultRejected = [];
  List<Result> _resultFinished = [];
  List<Result> _resultDelivery = [];
  List<Result> get resultRejected => _resultRejected;
  List<Result> get result => _result;
  List<Result> get resultFinished => _resultFinished;
  List<Result> get resultDelivery => _resultDelivery;

  void setDataResult(List<Result> newResult){
    _result = newResult;
    notifyListeners();
  }

  void setDataResultRejected(List<Result> resultRejected){
    _resultRejected = resultRejected;
    notifyListeners();
  }

  void setDataResultFinished(List<Result> resultFinished){
    _resultFinished = resultFinished;
    notifyListeners();
  }

  void setDataResultDelivery(List<Result> resultDelivery){
    _resultDelivery = resultDelivery;
    notifyListeners();
  }


}