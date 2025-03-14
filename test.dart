import 'dart:io';

// Liste globale pour stocker les contacts
List<Map<String, String>> contacts = [];

void main() {
  print("Bienvenue dans le gestionnaire de contacts !");
  menu();
}

void menu() {
  while (true) {
    print("\n1. Ajouter un contact");
    print("2. Afficher tous les contacts");
    print("3. Rechercher un contact");
    print("4. Supprimer un contact");
    print("5. Quitter");
    stdout.write("Choisissez une option : ");

    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        addContact();
        break;
      case '2':
        allContacts();
        break;
      case '3':
        searchContact();
        break;
      case '4':
        deleteContact();
        break;
      case '5':
        print("Au revoir !");
        exit(0);
      default:
        print("Option invalide, veuillez réessayer.");
    }
  }
}

// Fonction pour ajouter un contact
void addContact() {
  stdout.write("Entrez le nom du contact : ");
  String? nom = stdin.readLineSync();
  stdout.write("Entrez le numéro de téléphone : ");
  String? number = stdin.readLineSync();

  if (nom != null && number != null && nom.isNotEmpty && number.isNotEmpty) {
    contacts.add({'name': nom, 'number': number});
    print("Contact ajouté avec succès !");
  } else {
    print("Erreur : le nom et le numéro ne peuvent pas être vides.");
  }
}

// Fonction pour afficher tous les contacts
void allContacts() {
  if (contacts.isEmpty) {
    print("Aucun contact enregistré.");
  } else {
    print("\nListe des contacts :");
    for (var contact in contacts) {
      print("${contact['name']} : ${contact['number']}");
    }
  }
}

// Fonction pour rechercher un contact par nom
void searchContact() {
  stdout.write("Entrez le nom du contact à rechercher : ");
  String? searchName = stdin.readLineSync();

  if (searchName != null && searchName.isNotEmpty) {
    var foundContacts =
        contacts
            .where(
              (contact) => contact['name']!.toLowerCase().contains(
                searchName.toLowerCase(),
              ),
            )
            .toList();
    if (foundContacts.isNotEmpty) {
      print("\nRésultat(s) trouvé(s) :");
      for (var contact in foundContacts) {
        print("${contact['name']} : ${contact['number']}");
      }
    } else {
      print("Aucun contact trouvé avec ce nom.");
    }
  } else {
    print("Erreur : le nom de recherche ne peut pas être vide.");
  }
}

// Fonction pour supprimer un contact par nom
void deleteContact() {
  stdout.write("Entrez le nom du contact à supprimer : ");
  String? nameToDelete = stdin.readLineSync();

  if (nameToDelete != null && nameToDelete.isNotEmpty) {
    contacts.removeWhere(
      (contact) => contact['name']!.toLowerCase() == nameToDelete.toLowerCase(),
    );
    print("Contact supprimé avec succès !");
  } else {
    print("Erreur : le nom ne peut pas être vide.");
  }
}
