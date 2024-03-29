import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/controllers/home_controller.dart';
import 'package:gourmetexpress/app/models/address_model.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';
import 'package:gourmetexpress/app/utils/strings/home_string.dart';

class CurrentLocation extends StatefulWidget {
  final String docId;
  final String road;
  final String residenceNumber;
  final String district;
  final HomeController homeController;
  final bool isLoading;
  const CurrentLocation({
    Key? key,
    required this.docId,
    required this.road,
    required this.residenceNumber,
    required this.district,
    required this.homeController,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  late final TextEditingController roadController = TextEditingController();
  late final TextEditingController residenceNumberController =
      TextEditingController();
  late final TextEditingController districtController = TextEditingController();

  String get roadAndNumber => "${widget.road}, ${widget.residenceNumber}";
  HomeController get homeController => widget.homeController;
  String get docId => widget.docId;
  String get road => widget.road;
  String get residenceNumber => widget.residenceNumber;
  String get district => widget.district;

  @override
  void dispose() {
    roadController.dispose();
    residenceNumberController.dispose();
    districtController.dispose();
    super.dispose();
  }

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
                controller: roadController,
                decoration:
                    InputDecoration(labelText: HomeString.endereco.texto),
              ),
              TextField(
                controller: residenceNumberController,
                decoration: InputDecoration(
                  labelText: HomeString.numero.texto,
                ),
                maxLength: 8,
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: districtController,
                decoration: InputDecoration(labelText: HomeString.bairro.texto),
              ),
            ],
          ),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppString.cancelar.texto),
            ),
            MaterialButton(
              onPressed: () {
                if (docId.isEmpty) {
                  homeController.postAddress(
                    AddressModel(
                      road: roadController.text,
                      residenceNumber: residenceNumberController.text,
                      district: districtController.text,
                    ),
                  );
                } else {
                  homeController.putAddress(
                    AddressModel(
                      id: docId,
                      road: roadController.text,
                      residenceNumber: residenceNumberController.text,
                      district: districtController.text,
                    ),
                  );
                }

                Navigator.pop(context);
              },
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
        onTap: () {
          roadController.text = road;
          residenceNumberController.text = residenceNumber;
          districtController.text = district;
          openLocationSearchBox(context);
        },
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
            widget.isLoading
                ? const Padding(
                    padding: EdgeInsets.only(
                      left: 50.0,
                      top: 1.0,
                    ),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 3.0,
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        roadAndNumber,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.district,
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
