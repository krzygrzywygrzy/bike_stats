import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserInfo extends Equatable {
  final String sex;
  final int age, weight;

  UserInfo({@required this.sex, @required this.age, @required this.weight});

  @override
  List<Object> get props => [sex, age, weight];
}
