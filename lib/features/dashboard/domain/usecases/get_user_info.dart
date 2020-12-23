import 'package:bike_stats/core/usesases/usecase.dart';
import 'package:bike_stats/features/dashboard/domain/entities/user_info.dart';
import 'package:bike_stats/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

class GetUserInfo implements UseCase<UserInfo, NoParams> {
  final DashboardRepository repository;
  GetUserInfo(this.repository);

  @override
  Future<Either<Failure, UserInfo>> call(NoParams params) async {
    return await repository.getUserInfo();
  }
}

