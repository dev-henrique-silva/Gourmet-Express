import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gourmetexpress/app/components/custom_button.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';
import 'package:gourmetexpress/app/utils/strings/credit_card_string.dart';

class CustomCreditCard extends StatefulWidget {
  final VoidCallback onPressed;
  const CustomCreditCard({
    super.key,
    required this.onPressed,
  });

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = AppString.textVazio.texto;
  String expiryDate = AppString.textVazio.texto;
  String cardHolderName = AppString.textVazio.texto;
  String cvvCode = AppString.textVazio.texto;
  bool showBackView = false;

  VoidCallback? get onPressed => widget.onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          labelValidThru: CreditCardString.validade.texto,
          labelExpiredDate: CreditCardString.mmaa.texto,
          onCreditCardWidgetChange: (p0) {},
        ),
        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          formKey: formKey,
          numberValidationMessage:
              CreditCardString.insiraUmNumeroDeCartaoValido.texto,
          dateValidationMessage: CreditCardString.insiraUmaDataValida.texto,
          cvvValidationMessage: CreditCardString.insiraUmCvvValido.texto,
          onCreditCardModelChange: (data) {
            setState(() {
              cardNumber = data.cardNumber;
              expiryDate = data.expiryDate;
              cardHolderName = data.cardHolderName;
              cvvCode = data.cvvCode;
              showBackView = data.isCvvFocused;
            });
          },
          inputConfiguration: InputConfiguration(
            cardNumberDecoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              labelText: CreditCardString.numeroDoCartao.texto,
              hintText: CreditCardString.xxxxXxxxXxxxXxxx.texto,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            expiryDateDecoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              labelText: CreditCardString.dataDeValidade.texto,
              hintText: CreditCardString.xxxx.texto,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            cvvCodeDecoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              labelText: CreditCardString.cvv.texto,
              hintText: CreditCardString.xxx.texto,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            cardHolderDecoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              labelText: CreditCardString.titularDoCartao.texto,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ),
        const Spacer(),
        CustomButton(
          text: CreditCardString.confirmarACompra.texto,
          padding: 15,
          margin: 60,
          onPressed: confirmPayment,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  void confirmPayment() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            CreditCardString.confirmarSuaCompra.texto,
            style: const TextStyle(fontSize: 19),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('${CreditCardString.numeroDoCartao.texto}: $cardNumber'),
                Text('${CreditCardString.dataDeValidade.texto}: $expiryDate'),
                Text(
                    '${CreditCardString.titularDoCartao.texto}: $cardHolderName'),
                Text('${CreditCardString.cvv.texto}: $cvvCode')
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                AppString.cancelar.texto,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                AppString.confirmar.texto,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
