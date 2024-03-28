import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gourmetexpress/app/controllers/home_controller.dart';
import 'package:gourmetexpress/app/cubits/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeController _homeController;

  HomeCubit({required HomeController homeController})
      : _homeController = homeController,
        super(HomeInitial());

  Future<void> loadFoods() async {
    try {
      emit(HomeLoading());
      final burgers = await _homeController.getBurgers();
      final salads = await _homeController.getSalads();
      final desserts = await _homeController.getDesserts();
      final drinks = await _homeController.getDrinks();
      emit(
        HomeSuccess(
          foods: [...burgers, ...salads, ...desserts, ...drinks],
        ),
      );
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }
}
