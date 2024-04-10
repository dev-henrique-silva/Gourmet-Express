import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gourmetexpress/app/models/contacts_model.dart';
import 'package:gourmetexpress/app/navigation/Navigation_mixin.dart';
import 'package:gourmetexpress/app/utils/strings/app_string.dart';

class ContactView extends StatefulWidget {
  final String? uid;
  const ContactView({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> with NavigationMixin {
  String? get uid => widget.uid ?? AppString.textVazio.texto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          onPressed: () => goToHomePage(
            context,
            uid: uid,
            pushAndRemoveUntil: true,
          ),
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
