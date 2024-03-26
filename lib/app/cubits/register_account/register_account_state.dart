part of 'register_account_cubit.dart';

abstract class RegisterAccountState extends Equatable {
  const RegisterAccountState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterAccountState {}

class RegisterLoading extends RegisterAccountState {}

class RegisterSuccess extends RegisterAccountState {}

class RegisterFailure extends RegisterAccountState {
  final String message;

  const RegisterFailure({required this.message});

  @override
  List<Object> get props => [message];
}
