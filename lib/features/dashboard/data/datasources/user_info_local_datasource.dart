import 'package:bike_stats/core/error/exceptions.dart';
import 'package:bike_stats/features/dashboard/data/models/user_info_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


abstract class DashboardLocalDataSource {
  ///Gets the cached [UserInfoModel]
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<UserInfoModel> getUserInfo();
  Future<void> cacheUserInfo(UserInfoModel userInfoToCache);
}

const CACHED_USER_INFO = "CACHED_USER_INFO";
const CACHED_HISTORY = "CACHED_HISTORY";

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  final SharedPreferences sharedPreferences;
  DashboardLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheUserInfo(UserInfoModel userInfoToCache) {
    return sharedPreferences.setString(CACHED_USER_INFO, json.encode((userInfoToCache.toJson())));
  }

  @override
  Future<UserInfoModel> getUserInfo() {
    final jsonString = sharedPreferences.getString(CACHED_USER_INFO);
    if(jsonString != null){
      return Future.value(UserInfoModel.fromJson(json.decode(jsonString)));
    }else {
      throw CacheException();
    }
  }
  
}