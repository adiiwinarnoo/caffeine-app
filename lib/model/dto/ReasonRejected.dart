class ReasonRejectedModel {
  late String reasonName;
  late bool valueReason;

  ReasonRejectedModel({required this.reasonName, required this.valueReason});

  void checkedValue(){
    valueReason = !valueReason;
  }
}