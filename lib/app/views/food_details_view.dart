import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/custom_button.dart';
import 'package:gourmetexpress/app/components/custom_scroll_behavior.dart';
import 'package:gourmetexpress/app/components/description_of_ingredients.dart';
import 'package:gourmetexpress/app/controllers/food_details_controller.dart';
import 'package:gourmetexpress/app/models/food.dart';
import 'package:gourmetexpress/app/utils/strings/food_details_string.dart';

class FoodDetailsView extends StatefulWidget {
  final FoodModel food;

  final FoodDetailsController controller;
  const FoodDetailsView({
    super.key,
    required this.food,
    required this.controller,
  });

  @override
  State<FoodDetailsView> createState() => _FoodDetailsViewState();
}

class _FoodDetailsViewState extends State<FoodDetailsView> {
  FoodModel get food => widget.food;
  FoodDetailsController get controller => widget.controller;

  final ValueNotifier<List<bool>> _selectedAvailableAddons =
      ValueNotifier<List<bool>>([false, false, false]);

  late final double _height;

  @override
  void didChangeDependencies() {
    _height = MediaQuery.of(context).size.width * 1.0;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      food.imagePath,
                      width: double.infinity,
                      height: _height,
                      fit: BoxFit.cover,
                    ),
                    DescriptionOfIngredients(
                      food: food,
                      selectedAvailableAddons: _selectedAvailableAddons,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            text: FoodDetailsString.adicionarAoCarrinho.texto,
                            padding: 13,
                            margin: 15,
                            onPressed: () {
                              controller.postCartItem(
                                food: food,
                                selectedAddons: _selectedAvailableAddons.value
                                    .map((e) => food.availableAddons[
                                        _selectedAvailableAddons.value
                                            .indexOf(e)])
                                    .toList(),
                              );
                            },
                          ),
                          CustomButton(
                            text: FoodDetailsString.comprarAgora.texto,
                            padding: 13,
                            margin: 15,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18)
                  ],
                ),
              ),
            ),
          ),
        ),
        SafeArea(
            child: Opacity(
          opacity: 0.7,
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ))
      ],
    );
  }
}
