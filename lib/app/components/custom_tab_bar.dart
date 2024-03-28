import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/utils/Enums/food_category.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  const CustomTabBar({
    super.key,
    required this.tabController,
  });

  List<Tab> _buildCategotyTabs() {
    return FoodCategory.values
        .map(
          (category) => Tab(
            text: category.toString().split('.').last,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TabBar(
        controller: tabController,
        labelColor: Theme.of(context).colorScheme.inversePrimary,
        unselectedLabelColor: Theme.of(context).colorScheme.primary,
        indicatorColor: Theme.of(context).colorScheme.inversePrimary,
        tabs: _buildCategotyTabs(),
      ),
    );
  }
}
