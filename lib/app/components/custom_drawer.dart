import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/navigation/Navigation_mixin.dart';
import 'package:gourmetexpress/app/utils/images_assets/images_assets.dart';
import 'package:gourmetexpress/app/utils/strings/home_string.dart';

class CustomDrawer extends StatefulWidget {
  final Function() onTap;
  const CustomDrawer({
    super.key,
    required this.onTap,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> with NavigationMixin {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
              ),
              child: Image.asset(
                ImagesAssets.logoWithName,
                width: 100,
              )),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text(
              HomeString.home.texto,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.fastfood,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text(
              HomeString.meusPedidos.texto,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.contact_phone,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text(
              HomeString.contato.texto,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              goToContactPage(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text(
              HomeString.sair.texto,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: widget.onTap,
          ),
        ],
      ),
    );
  }
}
