import 'package:flutter/cupertino.dart';
import 'package:flutter_caffeine/model/dto/ReasonRejected.dart';

class ReasonRejected extends ChangeNotifier{

  bool _isChanged = false;
  String _reason = '';

  String get reasonText => _reason;
  bool get statusText => _isChanged;

  List<String> reasonList = [
    '재고가 부족합니다.',
    '영업시간이 종료되었습니다.',
    '기타 직접 작성'
  ];

  List<bool> reasonValue = [
    false,
    false,
    false
  ];

  void updateValue(int index, bool value) {
    for (int i = 0; i < reasonValue.length; i++) {
      if (i != index) {
        print('ini satu === $i dan index $index');
        reasonValue[i] = false;
      }
    }
    reasonValue[index] = value;
    notifyListeners();
  }

  void resetValue(){
    for (int i = 0; i< reasonValue.length; i++){
      reasonValue[i] = false;
      notifyListeners();
    }
  }

  void setChanged(bool value){
    _isChanged = value;
    notifyListeners();
  }

  void setTextReason(String value){
    _reason = value;
    notifyListeners();
  }

}