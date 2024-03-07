import 'package:flutter/cupertino.dart';

class FilterButtonProvider extends ChangeNotifier {
  String _filterAll = '';
  String _filterPickup = '';
  String _filterDelivery = '';
  String _filterDinein = '';

  bool allFilter = true;
  bool dineinFilter = false;
  bool deliveryFilter = false;
  bool pickupFilter = false;

  bool get typeOrder => allFilter;
  bool get typeOrderPickup => pickupFilter;
  bool get typeOrderDelivery => deliveryFilter;
  bool get typeOrderDinein => dineinFilter;

  String get filterAll => _filterAll;
  String get filterPickup => _filterPickup;
  String get filterDelivery => _filterDelivery;
  String get filterDinein => _filterDinein;

  void setAllFilter(bool value){
    allFilter = value;
    notifyListeners();
  }
  void setPickupFilter(bool value){
    pickupFilter = value;
    notifyListeners();
  }
  void setDeliveryFilter(bool value){
    deliveryFilter = value;
    notifyListeners();
  }
  void setDineinFilter(bool value){
    dineinFilter = value;
    notifyListeners();
  }
  void setTypeFilter(String value){
    _filterAll = value;
    notifyListeners();
  }
  void setTypeFilterPickup(String value){
    _filterPickup = value;
    notifyListeners();
  }
  void setTypeFilterDelivery(String value){
    _filterDelivery = value;
    notifyListeners();
  }
  void setTypeFilterDinein(String value){
    _filterDinein = value;
    notifyListeners();
  }
}