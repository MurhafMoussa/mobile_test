import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:things_todo/app/data/models/user_model/user_model.dart';
import 'package:things_todo/core/local_storage/shared_prefrences_keys.dart';

abstract class UserLocalDataSource {
  Future<void> saveUser(UserModel userModel);
  Future<UserModel?> getUser();
  Future<void> removeUser();
  Future<void> updateUser(UserModel userModel);
}

@Singleton(as: UserLocalDataSource)
class UserLocalDataSourceImp implements UserLocalDataSource {
  UserLocalDataSourceImp(this._sharedPrefrence);
  final SharedPreferences _sharedPrefrence;
  @override
  Future<void> saveUser(UserModel userModel) async {
    try {
      await _sharedPrefrence.setString(
        SharedPrefrencesKeys.userKey,
        jsonEncode(
          userModel.toJson(),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel?> getUser() async {
    try {
      final jsonString = _sharedPrefrence.getString(
        SharedPrefrencesKeys.userKey,
      );
      if (jsonString != null) {
        final json = jsonDecode(jsonString);
       
        return UserModel.fromJson(json);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeUser() async {
    try {
      await _sharedPrefrence.remove(SharedPrefrencesKeys.userKey);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    try {
      UserModel? user = await getUser();
      user = user?.copyWith(
        email: userModel.email,
        countryCode: userModel.countryCode,
        phone: userModel.phone,
        id: userModel.id,
        name: userModel.name,
      );
      if (user != null) {
        await _sharedPrefrence.setString(
          SharedPrefrencesKeys.userKey,
          jsonEncode(
            user.toJson(),
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
