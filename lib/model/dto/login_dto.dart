class LoginDTO {
  final int status;
  final String message;
  final String token;
  final UserData? userData;

  const LoginDTO ({
    required this.status,
    required this.message,
    required this.token,
    required this.userData
  });

  factory LoginDTO.fromJson(Map<String, dynamic> json) {
    return LoginDTO(
      status: json['status'],
      message: json['message'],
      token: json['token'],
      userData: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}

class UserData {
  final int id;
  final String accountId;
  final String accountPwd;
  final String phone;
  final String isOpen;
  final String representativePhone;
  final String representativeName;
  final String name;
  final String bankOwnerName;
  final String email;
  final String address;
  final String addressStreet;
  final double long;
  final double lat;
  final String regNo;
  final String bankName;
  final String bankAccount;
  final int rating;
  final int minDelFee;
  final int minDelOrder;
  final int minCookTime;
  final String deliveryCompany;
  final String createdAt;
  final String updatedAt;

  UserData({
    required this.id,
    required this.accountId,
    required this.accountPwd,
    required this.phone,
    required this.isOpen,
    required this.representativePhone,
    required this.representativeName,
    required this.name,
    required this.bankOwnerName,
    required this.email,
    required this.address,
    required this.addressStreet,
    required this.long,
    required this.lat,
    required this.regNo,
    required this.bankName,
    required this.bankAccount,
    required this.rating,
    required this.minDelFee,
    required this.minDelOrder,
    required this.minCookTime,
    required this.deliveryCompany,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      accountId: json['account_id'],
      accountPwd: json['account_pwd'],
      phone: json['phone'],
      isOpen: json['is_open'],
      representativePhone: json['representative_phone'],
      representativeName: json['representative_name'],
      name: json['name'],
      bankOwnerName: json['bank_owner_name'],
      email: json['email'],
      address: json['address'],
      addressStreet: json['address_street'],
      long: json['long'],
      lat: json['lat'],
      regNo: json['reg_no'],
      bankName: json['bank_name'],
      bankAccount: json['bank_account'],
      rating: json['rating'],
      minDelFee: json['min_del_fee'],
      minDelOrder: json['min_del_order'],
      minCookTime: json['min_cook_time'],
      deliveryCompany: json['delivery_company'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
