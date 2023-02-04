import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:things_todo/app/domain/entities/user.dart';
import 'package:things_todo/app/domain/usecases/get_user_usecase.dart';
import 'package:things_todo/app/domain/usecases/post_delete_user_usecase.dart';
import 'package:things_todo/app/domain/usecases/post_logout_usecase.dart';
import 'package:things_todo/core/errors/network_exceptions.dart';
import 'package:things_todo/core/resources/app_routes.dart';
import 'package:things_todo/core/use_case/use_case.dart';
import 'package:things_todo/core/widgets/display_data_widgets.dart';
import 'package:things_todo/main.dart';

class HomeController extends GetxController {
  HomeController(
    this._postDeleteUserUseCase,
    this._postLogoutUseCase,
    this._getUserUseCase,
  );
  final Rx<User> user = Rx<User>(
    const User(countryCode: '', email: '', name: '', phone: ''),
  );
  @override
  Future<void> onReady() async {
    await getUser();
    super.onReady();
  }

  final PostDeleteUserUseCase _postDeleteUserUseCase;
  final PostLogoutUseCase _postLogoutUseCase;
  final GetUserUseCase _getUserUseCase;
  final RxBool isLoading = false.obs;
  String getEmail() => user.value.email;
  String getUserName() => user.value.name;
  String getPhoneNumber() => '${user.value.countryCode} ${user.value.phone}';
  Future<void> getUser() async {
    isLoading.value = true;

    final Either<NetworkExceptions, User> response = await _getUserUseCase(
      NoParams(),
    );
    response.fold(
      (NetworkExceptions error) {},
      (User data) {
      
        user.value = data;
      },
    );
    isLoading.value = false;
  }

  Future<void> logout() async => await _getResultForDeleteAccountAndLogout(
        () => _postLogoutUseCase(
          NoParams(),
        ),
      );
  Future<void> deleteUser() async => await _getResultForDeleteAccountAndLogout(
        () => _postDeleteUserUseCase(
          NoParams(),
        ),
      );
  Future<void> _getResultForDeleteAccountAndLogout(
    Future<Either<NetworkExceptions, String>> Function() apiCall,
  ) async {
    isLoading.value = true;

    final Either<NetworkExceptions, String> response = await apiCall();
    response.fold(
      (NetworkExceptions error) {
        showErrorSnackBar(
          NetworkExceptions.getErrorMessage(
            error,
          ),
          MobileTest.navigatorKey.currentState!.context,
        );
        if (error is UnauthorizedRequest) {
          Get.offAllNamed(AppRoutes.loginRoute);
        }
      },
      (String data) {
        showSucessSnackBar(
          data,
          MobileTest.navigatorKey.currentState!.context,
        );
        Get.offAllNamed(AppRoutes.welcomeRoute);
      },
    );
    isLoading.value = false;
  }
}
