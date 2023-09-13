import 'package:api_example_131/models/users/user_model.dart';

class DataUserModel {
  int limit;
  int skip;
  int total;
  List<UserModel> users;

  DataUserModel({required this.limit,
    required this.skip,
    required this.total,
    required this.users});

  factory DataUserModel.fromJson(Map<String, dynamic> json){
    List<UserModel> mUsers = [];

    (json['users'] as List<Map<String, dynamic>>).forEach((element) {
      mUsers.add(UserModel.fromJson(element));
    });

    return DataUserModel(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        users: mUsers
    );
  }
}
