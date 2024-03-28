import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gourmetexpress/app/components/current_location.dart';
import 'package:gourmetexpress/app/components/custom_sliver_app_bar.dart';
import 'package:gourmetexpress/app/components/custom_tab_bar.dart';
import 'package:gourmetexpress/app/components/custom_tile.dart';
import 'package:gourmetexpress/app/components/description_box.dart';
import 'package:gourmetexpress/app/cubits/home/home_cubit.dart';
import 'package:gourmetexpress/app/cubits/home/home_state.dart';
import 'package:gourmetexpress/app/models/food.dart';
import 'package:gourmetexpress/app/utils/Enums/food_category.dart';

class HomeView extends StatefulWidget {
  final HomeCubit homeCubit;
  const HomeView({
    Key? key,
    required this.homeCubit,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  HomeCubit get homeCubit => widget.homeCubit;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
    homeCubit.loadFoods();
  }

  @override
  void didUpdateWidget(covariant HomeView oldWidget) {
    homeCubit.loadFoods();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            CustomSliverAppBar(
              title: CustomTabBar(
                tabController: _tabController,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const CurrentLocation(),
                  const DescriptionBox()
                ],
              ),
            ),
          ];
        },
        body: BlocBuilder<HomeCubit, HomeState>(
          bloc: homeCubit,
          builder: (context, state) {
            if (state is HomeSuccess) {
              return TabBarView(
                controller: _tabController,
                children: _getFoodInThisCategory(state),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  List<Widget> _getFoodInThisCategory(HomeSuccess state) {
    return FoodCategory.values.map((category) {
      final List<Food> categoryMenu = state.foods
          .where((food) => food.category.contains(category.name))
          .toList();

      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return CustomTile(
            food: food,
            onTap: () {},
          );
        },
      );
    }).toList();
  }
}
