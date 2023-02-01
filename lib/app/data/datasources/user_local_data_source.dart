import 'package:injectable/injectable.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:things_todo/core/local_storage/shared_prefrences_keys.dart';
import 'package:things_todo/app/data/models/user_model/user_model.dart';

abstract class UserLocalDataSource {
  Future<void> saveUser(UserModel userModel);
}
@Singleton(as : UserLocalDataSource)
class UserLocalDataSourceImp implements UserLocalDataSource {
  UserLocalDataSourceImp(this._sharedPrefrence);
  final SharedPreferences _sharedPrefrence;
  @override
  Future<void> saveUser(UserModel userModel) async {
    try {
      await _sharedPrefrence.setString(
        SharedPrefrencesKeys.userKey,
        userModel.toString(),
      );
    } catch (e){
     rethrow;
    }
  }
}
