import 'package:api_example_131/models/users/coordinate_model.dart';

class AddressModel {
  String? address;
  String? city;
  CoordinatesModel? coordinates;
  String? postalCode;
  String? state;

  AddressModel({required this.address,
    required this.city,
    required this.coordinates,
    required this.state,
    required this.postalCode});

  factory AddressModel.fromJson(Map<String, dynamic> json){
    return AddressModel(
        address: json['address'],
        city: json['city'],
        coordinates: CoordinatesModel.fromJson(json['coordinates']),
        state: json['state'],
        postalCode: json['postalCode']
    );
  }
}
