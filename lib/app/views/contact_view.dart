import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/models/contacts_model.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';

class ContactView extends StatelessWidget {
  final Key? key;

  const ContactView({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppString.contato.texto,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: Contacts.list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    Image.asset(
                      Contacts.list[index].imagePath,
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 15),
                    AutoSizeText(
                      Contacts.list[index].content,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
