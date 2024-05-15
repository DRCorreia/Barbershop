import 'package:asyncstate/asyncstate.dart';
import 'package:dw_barbershop/core/exceptions/service_exception.dart';
import 'package:dw_barbershop/core/fp/either.dart';
import 'package:dw_barbershop/core/providers/application_providers.dart';
import 'package:dw_barbershop/features/auth/login/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVM extends _$LoginVM {
  @override
  LoginState build() => LoginState.initial();

  Future<void> login(String email, String password) async {

    final loaderHandler =  AsyncLoaderHandler()..start();

    final loginService = ref.watch(userLoginServiceProvider);

    final result = await loginService.execute(email, password);

    switch (result) {
      case Success():
        //buscar dados do usuário logado
        //fazer uma análise do tipo de login
        break;
      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
            status: LoginStateStatus.error, errorMessage: () => message);
    }

    loaderHandler.close();
  }
}
