class Contacts {
  final String name;
  final String content;
  final String imagePath;

  Contacts({
    required this.name,
    required this.content,
    required this.imagePath,
  });

  static List<Contacts> list = [
    Contacts(
      name: "Telefone",
      content: "79 9 9999-9999",
      imagePath: "assets/img/contacts/logo_phone.png",
    ),
    Contacts(
      name: "WhatsApp",
      content: "79 9 0000-0000",
      imagePath: "assets/img/contacts/logo_whatsApp.png",
    ),
    Contacts(
      name: "Gmail",
      content: "gourmet.express@gmail.com",
      imagePath: "assets/img/contacts/logo_gmail.png",
    ),
    Contacts(
      name: "Instagram",
      content: "@gourmet_express",
      imagePath: "assets/img/contacts/logo_instagram.png",
    ),
    Contacts(
      name: "Facebook",
      content: "fb.com/gourmet_express",
      imagePath: "assets/img/contacts/logo_facebook.png",
    ),
  ];
}
