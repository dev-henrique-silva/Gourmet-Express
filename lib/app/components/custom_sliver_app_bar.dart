import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Widget title;
  final Widget child;

  const CustomSliverAppBar({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 325,
      collapsedHeight: 100,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        )
      ],
      title: Text(AppString.gourmetExpress.texto),
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(
          left: 0,
          right: 0,
          top: 0,
        ),
        expandedTitleScale: 1,
      ),
    );
  }
}
