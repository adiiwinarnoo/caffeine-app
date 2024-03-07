class UpdateOrderDTO {
  final int status;
  final String message;
  final DataUpdateOrder? dataUpdateOrder;

  UpdateOrderDTO({required this.status, required this.message, required this.dataUpdateOrder});

  factory UpdateOrderDTO.fromJson(Map<String, dynamic> json) {
    return UpdateOrderDTO(
      status: json['status'],
      message: json['message'],
      dataUpdateOrder: json['data'] != null ? DataUpdateOrder.fromJson(json['data']) : null,
    );
  }
}

class DataUpdateOrder {
  final int companyId;
  final int id;
  final int userId;
  final String status;
  final String createdAt;
  final bool statusPayment;
  final int estimatedTime;
  final String updatedAt;

  DataUpdateOrder({
    required this.companyId,
    required this.id,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.statusPayment,
    required this.estimatedTime,
    required this.updatedAt,
  });

  factory DataUpdateOrder.fromJson(Map<String, dynamic> json) {
    final estimatedTime = json['estimated_time'];
    final parsedEstimatedTime = estimatedTime != null ? int.tryParse(estimatedTime.toString()) ?? 0 : 0;

    return DataUpdateOrder(
      companyId: json['companyid'],
      id: json['id'],
      userId: json['userId'],
      status: json['status'],
      createdAt: json['createdAt'],
      statusPayment: json['status_payment'],
      estimatedTime: parsedEstimatedTime,
      updatedAt: json['updatedAt'],
    );
  }
}
