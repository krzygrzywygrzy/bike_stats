import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_info.dart';

abstract class DashboardRepository{
  Future<Either<Failure, UserInfo>> getUserInfo();
  Future<Either<Failure, UserInfo>> saveUserInfo();
}