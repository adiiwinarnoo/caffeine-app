import 'package:flutter/cupertino.dart';

class OrderDTO {
  final int status;
  final String message;
  final Data? data;

  OrderDTO({required this.status, required this.message, required this.data});

  factory OrderDTO.fromJson(Map<String, dynamic> json) {
    return OrderDTO(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  MetaData? metadata;
  List<Result> result;

  Data({required this.metadata, required this.result});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      metadata:
          json['metadata'] != null ? MetaData.fromJson(json['metadata']) : null,
      result: (json['result'] as List<dynamic>)
          .map((item) => Result.fromJson(item))
          .toList(),
    );
  }
}

class MetaData {
  final int page;
  final int count;
  final int totalPage;
  final int totalData;

  MetaData(
      {required this.page,
      required this.count,
      required this.totalPage,
      required this.totalData});

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
        page: json['page'],
        count: json['count'],
        totalPage: json['totalPage'],
        totalData: json['totalData']);
  }
}

class Result {
  final int id;
  final int deliveryPrice;
  final int totalPrice;
  final String type;
  final String orderType;
  final String status;
  final int? estimatedTime;
  final bool statusPayment;
  final String createdAt;
  final String updatedAt;
  final AddressUser? addressUser;
  final Company? company;
  final User user;
  final Payment payment;
  final List<VoucherHistories> orderVoucherHistories;
  final List<ChartOrders> chartOrders;
  final int totalGross;

  Result(
      {required this.id,
      required this.deliveryPrice,
      required this.totalPrice,
      required this.type,
      required this.orderType,
      required this.status,
      required this.estimatedTime,
      required this.statusPayment,
      required this.createdAt,
      required this.updatedAt,
      required this.addressUser,
      required this.company,
      required this.user,
      required this.payment,
      required this.orderVoucherHistories,
      required this.chartOrders,
      required this.totalGross});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
        id: json['id'],
        deliveryPrice: json['delivery_price'],
        totalPrice: json['total_price'],
        type: json['type'],
        orderType: json['order_type'],
        status: json['status'],
        estimatedTime: json['estimated_time'],
        statusPayment: json['status_payment'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        addressUser: json['address_user'] != null ? AddressUser.fromJson(json['address_user']) : null,
        company: json['company'],
        user: User.fromJson(json['user']),
        payment: Payment.fromJson(json['payment']),
        orderVoucherHistories: List<VoucherHistories>.from(
            json['order_voucher_histories']
                .map((x) => VoucherHistories.fromJson(x))),
        chartOrders: List<ChartOrders>.from(
            json['chart_orders'].map((x) => ChartOrders.fromJson(x))),
        totalGross: json['total_gross']);
  }
}

class AddressUser {
  final String address;

  AddressUser({required this.address});

  factory AddressUser.fromJson(Map<String, dynamic> json) {
    return AddressUser(address: json['address']);
  }
}

class Company {
  final String name;
  final String phone;

  Company({required this.name, required this.phone});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(name: json['name'], phone: json['phone']);
  }
}

class User {
  final String name;
  final String phone;
  final String email;

  User({required this.name, required this.phone, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], phone: json['phone'], email: json['email']);
  }
}

class Payment {
  final String paymentType;
  final String transaction;
  final String thirdPartyId;

  Payment(
      {required this.paymentType,
      required this.transaction,
      required this.thirdPartyId});

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
        paymentType: json['payment_type'],
        transaction: json['transaction'],
        thirdPartyId: json['third_party_id']);
  }
}

class VoucherHistories {
  final String voucherName;
  final int amount;

  VoucherHistories({required this.voucherName, required this.amount});

  factory VoucherHistories.fromJson(Map<String, dynamic> json) {
    return VoucherHistories(
        voucherName: json['voucher_name'], amount: json['amount']);
  }
}

class ChartOrders {
  final int id;
  final String createdAt;
  final String updatedAt;
  final int cartId;
  final int orderId;
  final Cart cart;

  ChartOrders(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.cartId,
      required this.orderId,
      required this.cart});

  factory ChartOrders.fromJson(Map<String, dynamic> json) {
    return ChartOrders(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      cartId: json['cartId'],
      orderId: json['orderId'],
      cart: Cart.fromJson(json['cart']),
    );
  }
}

class Cart {
  final int productAndOptionPrice;
  final int quantity;
  final Product product;
  final Company company;
  final List<CartOptional> cartOptional;

  Cart(
      {required this.productAndOptionPrice,
      required this.quantity,
      required this.product,
      required this.company,
      required this.cartOptional});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
        productAndOptionPrice: json['product_and_option_total_price'],
        quantity: json['quantity'],
        product: Product.fromJson(json['product']),
        company: Company.fromJson(json['company']),
        cartOptional: (json['cart_optional_products'] as List<dynamic>).map((item) => CartOptional.fromJson(item)).toList());
  }
}

class Product {
  final String name;
  final String thumbnail;
  final int price;

  Product({required this.name, required this.thumbnail, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        name: json['name'], thumbnail: json['thumbnail'], price: json['price']);
  }
}

class CartOptional {
  final int id;
  final ProductOption productOption;
  final List<OptionListCart> optionListCart;

  CartOptional(
      {required this.id,
      required this.productOption,
      required this.optionListCart});

  factory CartOptional.fromJson(Map<String, dynamic> json) {
    List<OptionListCart> convertedOptionListCart = (json['optionlist_carts'] as List<dynamic>)
        .map((item) => OptionListCart.fromJson(item))
        .toList();

    return CartOptional(
        id: json['id'],
        productOption: ProductOption.fromJson(json['product_option']),
        optionListCart:convertedOptionListCart
    );
  }
}

class ProductOption {
  final String name;

  ProductOption({required this.name});

  factory ProductOption.fromJson(Map<String, dynamic> json) {
    return ProductOption(name: json['name']);
  }
}

class OptionListCart {
  final int value;
  final ProductOptionList productOptionList;

  OptionListCart({required this.value, required this.productOptionList});

  factory OptionListCart.fromJson(Map<String, dynamic> json) {
    return OptionListCart(
        value: json['value'], 
        productOptionList: ProductOptionList.fromJson(json['product_option_list'])
    );
  }
}

class ProductOptionList {
  final String name;
  final int addtionalPrice;

  ProductOptionList({required this.name, required this.addtionalPrice});

  factory ProductOptionList.fromJson(Map<String, dynamic> json) {
    return ProductOptionList(
        name: json['name'], addtionalPrice: json['addtional_price']);
  }
}
