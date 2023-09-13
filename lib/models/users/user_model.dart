import 'package:api_example_131/models/users/address_model.dart';
import 'package:api_example_131/models/users/bank_model.dart';
import 'package:api_example_131/models/users/company_model.dart';
import 'package:api_example_131/models/users/hair_model.dart';

class UserModel {
  AddressModel address;
  int age;
  BankModel bank;
  String birthDate;
  String bloodGroup;
  CompanyModel company;
  String domain;
  String ein;
  String email;
  String eyeColor;
  String firstName;
  String gender;
  HairModel hair;
  int height;
  int id;
  String image;
  String ip;
  String lastName;
  String macAddress;
  String maidenName;
  String password;
  String phone;
  String ssn;
  String university;
  String userAgent;
  String username;
  double weight;

  UserModel({
    required this.address,
    required this.age,
    required this.bank,
    required this.birthDate,
    required this.bloodGroup,
    required this.company,
    required this.domain,
    required this.ein,
    required this.email,
    required this.eyeColor,
    required this.firstName,
    required this.gender,
    required this.hair,
    required this.height,
    required this.id,
    required this.image,
    required this.ip,
    required this.lastName,
    required this.macAddress,
    required this.maidenName,
    required this.password,
    required this.phone,
    required this.ssn,
    required this.university,
    required this.userAgent,
    required this.username,
    required this.weight});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        address: AddressModel.fromJson(json['address']),
        age: json['age'],
        bank: BankModel.fromJson(json['bank']),
        birthDate: json['birthDate'],
        bloodGroup: json['bloodGroup'],
        company: CompanyModel.fromJson(json['company']),
        domain: json['domain'],
        ein: json['ein'],
        email: json['email'],
        eyeColor: json['eyeColor'],
        firstName: json['firstName'],
        gender: json['gender'],
        hair: HairModel.fromJson(json['hair']),
        height: json['height'],
        id: json['id'],
        image: json['image'],
        ip: json['ip'],
        lastName: json['lastName'],
        macAddress: json['macAddress'],
        maidenName: json['maidenName'],
        password: json['password'],
        phone: json['phone'],
        ssn: json['ssn'],
        university: json['university'],
        userAgent: json['userAgent'],
        username: json['username'],
        weight: json['weight']
    );
  }
}