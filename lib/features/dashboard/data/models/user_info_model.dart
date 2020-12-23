import 'package:meta/meta.dart';
import '../../domain/entities/user_info.dart';

class UserInfoModel extends UserInfo {
  UserInfoModel(
    String sex,
    int age,
    int weight,
  ) : super(sex: sex, age: age, weight: weight);

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      json["sex"],
      json["age"],
      json["weight"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "sex": sex,
      "age": age,
      "weight": weight,
    };
  }
}
