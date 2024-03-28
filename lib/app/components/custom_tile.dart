import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/components/placeholder_image.dart';
import 'package:gourmetexpress/app/models/food.dart';
import 'package:gourmetexpress/app/utils/extensions/double_extensions.dart';

class CustomTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const CustomTile({
    super.key,
    required this.food,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        food.price.toReal(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        food.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FutureBuilder(
                    future: precacheImage(AssetImage(food.imagePath), context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const PlaceholderImage(
                          width: 90,
                          height: 90,
                        );
                      } else {
                        return Image.asset(
                          food.imagePath,
                          height: 90,
                          fit: BoxFit.cover,
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}
