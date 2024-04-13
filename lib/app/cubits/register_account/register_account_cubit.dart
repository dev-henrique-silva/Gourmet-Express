import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gourmetexpress/app/controllers/register_account_controller.dart';

part 'register_account_state.dart';

class RegisterAccountCubit extends Cubit<RegisterAccountState> {
  final RegisterAccountController _registerController;

  RegisterAccountCubit({required RegisterAccountController registerController})
      : _registerController = registerController,
        super(RegisterInitial());

  Future<void> registerAccount({
    required String email,
    required String password,
    required String confirm,
  }) async {
    emit(RegisterLoading());

    if (password != confirm) {
      emit(const RegisterFailure(
          message: "As senhas não coincidem! Por favor, tente novamente."));
      return;
    }

    try {
      final result = await _registerController.registerAccount(
          email: email, password: password);
      if (result) {
        emit(RegisterSuccess());
      } else {
        emit(const RegisterFailure(
            message: "Erro ao registrar conta! Por favor, tente novamente."));
      }
    } catch (e) {
      emit(const RegisterFailure(
          message: "Erro ao registrar conta! Por favor, tente novamente."));
    }
  }
}
