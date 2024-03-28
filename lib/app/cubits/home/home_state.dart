import 'package:equatable/equatable.dart';
import 'package:gourmetexpress/app/models/food.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Food> foods;

  const HomeSuccess({
    required this.foods,
  });

  @override
  List<Object> get props => [foods];
}

class HomeFailure extends HomeState {
  final String message;

  const HomeFailure({required this.message});

  @override
  List<Object> get props => [message];
}
