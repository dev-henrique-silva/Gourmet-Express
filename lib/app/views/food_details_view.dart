import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/custom_button.dart';
import 'package:gourmetexpress/app/components/custom_scroll_behavior.dart';
import 'package:gourmetexpress/app/components/description_of_ingredients.dart';
import 'package:gourmetexpress/app/controllers/food_details_controller.dart';
import 'package:gourmetexpress/app/navigation/Navigation_mixin.dart';
import 'package:gourmetexpress/app/utils/args/food_details_args.dart';
import 'package:gourmetexpress/app/utils/strings/food_details_string.dart';

class FoodDetailsView extends StatefulWidget {
  final FoodDetailsArgs foodDetailsArgs;

  final FoodDetailsController foodDetailsController;
  const FoodDetailsView({
    Key? key,
    required this.foodDetailsArgs,
    required this.foodDetailsController,
  }) : super(key: key);

  @override
  State<FoodDetailsView> createState() => _FoodDetailsViewState();
}

class _FoodDetailsViewState extends State<FoodDetailsView>
    with NavigationMixin {
  FoodDetailsArgs get foodDetailsArgs => widget.foodDetailsArgs;

  FoodDetailsController get foodDetailsController =>
      widget.foodDetailsController;

  final ValueNotifier<List<bool>> _selectedAvailableAddons =
      ValueNotifier<List<bool>>([]);

  late final double _height;

  @override
  void initState() {
    foodDetailsController.fillSelectedAddons(
      foodDetailsArgs.food,
      foodDetailsArgs.selectedAddons,
      _selectedAvailableAddons,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _height = MediaQuery.of(context).size.width * 1.0;

    super.didChangeDependencies();
  }

  void widgetDidUpdate(oldWidget) {
    _height = MediaQuery.of(context).size.width * 1.0;

    foodDetailsController.fillSelectedAddons(
      foodDetailsArgs.food,
      foodDetailsArgs.selectedAddons,
      _selectedAvailableAddons,
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _selectedAvailableAddons.removeListener(() {});
    _selectedAvailableAddons.dispose();
    super.dispose();
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
                      foodDetailsArgs.food.imagePath,
                      width: double.infinity,
                      height: _height,
                      fit: BoxFit.cover,
                    ),
                    DescriptionOfIngredients(
                      food: foodDetailsArgs.food,
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
                              if (foodDetailsArgs.cameByCartPage &&
                                  foodDetailsArgs.cartItem != null) {
                                foodDetailsController.putCartItem(
                                  uid: foodDetailsArgs.uid!,
                                  updatedCartItem: foodDetailsArgs.cartItem!,
                                  selectedAvailableAddons:
                                      _selectedAvailableAddons,
                                );

                                Navigator.pop(context);
                              } else {
                                foodDetailsController.postCartItem(
                                  uid: foodDetailsArgs.uid!,
                                  food: foodDetailsArgs.food,
                                  selectedAvailableAddons:
                                      _selectedAvailableAddons,
                                );

                                Navigator.pop(context);
                              }
                            },
                          ),
                          CustomButton(
                            text: FoodDetailsString.comprarAgora.texto,
                            padding: 13,
                            margin: 15,
                            onPressed: () {
                              goToPaymentPage(
                                context,
                                cameByCartPage: foodDetailsArgs.cameByCartPage,
                              );

                              foodDetailsController.insertDatabase(
                                food: foodDetailsArgs.food,
                                selectedAvailableAddons:
                                    _selectedAvailableAddons,
                              );
                            },
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
            margin: const EdgeInsets.only(left: 8, top: 5),
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
