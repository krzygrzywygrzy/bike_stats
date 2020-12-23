import 'package:bike_stats/core/error/exceptions.dart';
import 'package:bike_stats/core/error/failures.dart';
import 'package:bike_stats/features/dashboard/data/datasources/user_info_local_datasource.dart';
import 'package:bike_stats/features/dashboard/domain/entities/user_info.dart';
import 'package:bike_stats/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class DashboardRepositoryImpl implements DashboardRepository{
  final DashboardLocalDataSource dataSource;
  DashboardRepositoryImpl({@required this.dataSource});

  @override
  Future<Either<Failure, UserInfo>> getUserInfo() async {
    try{
      final data = await dataSource.getUserInfo();
      return Right(data);
    } on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserInfo>> saveUserInfo() async {
    // TODO: implement saveUserInfo
    throw UnimplementedError();
  }

}