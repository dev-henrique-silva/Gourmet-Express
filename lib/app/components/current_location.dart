import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';
import 'package:gourmetexpress/app/utils/strings/home_string.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(HomeString.enderecoDeEntrega.texto),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration:
                    InputDecoration(hintText: HomeString.endereco.texto),
              ),
              TextField(
                decoration: InputDecoration(hintText: HomeString.numero.texto),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(hintText: HomeString.bairro.texto),
              ),
            ],
          ),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppString.cancelar.texto),
            ),
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppString.salvar.texto),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GestureDetector(
        onTap: () => openLocationSearchBox(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  HomeString.enderecoDeEntrega.texto,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rua dos Bobos, 0 ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Jardim dos Bobos, Bobolândia - BO",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
