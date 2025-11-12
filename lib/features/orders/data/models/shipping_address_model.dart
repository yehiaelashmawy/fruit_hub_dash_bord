import 'package:fruit_hub_dash_bord/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? phone;
  String? addressDetails;
  String? city;
  String? email;
  String? floor;

  ShippingAddressModel({
    this.name,
    this.phone,
    this.addressDetails,
    this.floor,
    this.city,
    this.email,
  });

  ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    addressDetails = json['addressDetails'];
    floor = json['floor'];
    city = json['city'];
    email = json['email'];
  }

  toEntity() {
    return ShippingAddressEntity(
      name: name,
      phone: phone,
      addressDetails: addressDetails,
      floor: floor,
      city: city,
      email: email,
    );
  }

  toJson() {
    return {
      'name': name,
      'phone': phone,
      'addressDetails': addressDetails,
      'floor': floor,
      'city': city,
      'email': email,
    };
  }
}
