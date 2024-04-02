import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/models/addon_model.dart';
import 'package:gourmetexpress/app/models/food_model.dart';
import 'package:gourmetexpress/app/utils/extensions/double_extensions.dart';
import 'package:gourmetexpress/app/utils/strings/food_details_string.dart';

class DescriptionOfIngredients extends StatefulWidget {
  final FoodModel food;
  final ValueNotifier<List<bool>> selectedAvailableAddons;

  const DescriptionOfIngredients({
    Key? key,
    required this.food,
    required this.selectedAvailableAddons,
  }) : super(key: key);

  @override
  State<DescriptionOfIngredients> createState() =>
      _DescriptionOfIngredientsState();
}

class _DescriptionOfIngredientsState extends State<DescriptionOfIngredients> {
  ValueNotifier<List<bool>> get _selectedAvailableAddons =>
      widget.selectedAvailableAddons;

  FoodModel get food => widget.food;

  @override
  void initState() {
    super.initState();

    for (var element in List<bool>.filled(
      _selectedAvailableAddons.value.length,
      false,
    )) {
      _selectedAvailableAddons.value.add(element);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            food.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            food.price.toReal(),
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            food.description,
          ),
          const SizedBox(height: 10),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
            height: 1,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          Text(
            FoodDetailsString.adicionaisDisponiveis.texto,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ValueListenableBuilder<List<bool>>(
              valueListenable: _selectedAvailableAddons,
              builder: (context, selectedAvailableAddons, child) {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: food.availableAddons.length,
                  itemBuilder: (context, index) {
                    AddonModel addon = food.availableAddons[index];

                    return CheckboxListTile(
                      title: Text(addon.name),
                      subtitle: Text(
                        addon.price.toReal(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      value: selectedAvailableAddons[index],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedAvailableAddons[index] = value!;
                        });
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
