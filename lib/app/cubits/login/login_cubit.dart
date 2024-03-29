import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gourmetexpress/app/controllers/login_controller.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginController _loginController;

  LoginCubit({required LoginController loginController})
      : _loginController = loginController,
        super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final result =
          await _loginController.login(email: email, password: password);
      if (result.isNotEmpty) {
        emit(LoginSuccess(uid: result));
      } else {
        emit(const LoginFailure(
            message: 'Falha no login! Verique seu e-mail e senha.'));
      }
    } catch (e) {
      emit(const LoginFailure(
          message: 'Falha no login! Por favor, tente novamente.'));
    }
  }
}
