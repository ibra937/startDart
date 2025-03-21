import 'dart:io';

List<Map<String, String>> tasks = [];

void main() {
  stdout.write("Bienvenue dans votre To-Do List!");

  options();
}

void options() {
  while (true) {
    stdout.write("1. Ajouter une tache\n");
    stdout.write("2. Afficher tous les taches\n");
    stdout.write("3. Marquer une tache comme terminee\n");
    stdout.write("4. Supprimer un tache\n");
    stdout.write("5. Quitter\n");

    stdout.write("Chisissez une option : ");
    String? choice = stdin.readLineSync();

    if (choice != null && choice.isNotEmpty) {
      switch (choice) {
        case "1":
          addTask();
          break;
        case "2":
          getTasks();
          break;
        case "3":
          doneTask();
          break;
        case "4":
          deleteTask();
          break;
        case "5":
          stdout.write("Au revoir !");
          exit(0);
        case "6":
          deleteAll();
          break;
        default:
          stdout.write("\n\n!----------!\n");
          stdout.write("\nCe choix n'existe pas !\n");
          stdout.write("\n!----------!\n\n");
      }
    } else {
      stdout.write("\n\n!----------!\n");
      stdout.write("Veuillez Entrer votre choix !");
      stdout.write("\n!----------!\n\n");
    }
  }
}

void addTask() {
  stdout.write("\n\n!----------!\n");

  stdout.write("Entrez la tache : ");
  String? task = stdin.readLineSync();
  if (task != null && task.isNotEmpty) {
    stdout.write("Tache ajoute avec succes !");
    tasks.add({"status": "[ ]", "name": "$task"});
  } else {
    stdout.write("Vous ne pouvez pas Entrer");
  }

  stdout.write("\n\n!----------!\n");
}

void getTasks() {
  stdout.write("\n\n!----------!\n");
  int j = 0;
  for (var task in tasks) {
    j += 1;
    stdout.write("$j. ${task['status']} ${task['name']}\n");
  }
  stdout.write("\n!----------!\n\n");
}

void doneTask() {
  stdout.write("\n\n!----------!\n");
  stdout.write("Entrer la tache que vous voulez marquer comme terminer !");
  String? taskdone = stdin.readLineSync();
  if (taskdone != null && taskdone.isNotEmpty) {
    var foundTask =
        tasks
            .where(
              (task) =>
                  task['name']!.toLowerCase().contains(taskdone.toLowerCase()),
            )
            .toList();
    if (foundTask.isNotEmpty) {
      for (var found in foundTask) {
        found['status'] = '[v]';
      }
      stdout.write("\n\n!----------!\n");
      stdout.write("Tache terminer avec succes !");
      stdout.write("\n!----------!\n\n");
    } else {
      stdout.write("\n\n!----------!\n");
      stdout.write("La tache entrer n'a pas ete trouver !");
      stdout.write("\n!----------!\n\n");
    }
  } else {
    stdout.write("\n\n!----------!\n");
    stdout.write("Veuillez Entrer votre choix !");
    stdout.write("\n!----------!\n\n");
  }
}

void deleteTask() {
  stdout.write("\n\n!----------!\n");
  stdout.write("Entrer la tache que vous voulez supprimer : ");
  String? taskToDelete = stdin.readLineSync();
  if (taskToDelete != null && taskToDelete.isNotEmpty) {
    tasks.removeWhere(
      (task) => task['name']!.toLowerCase() == taskToDelete.toLowerCase(),
    );
    stdout.write("\n\n!----------!\n");
    stdout.write("Tache supprimer avec succes !");
    stdout.write("\n!----------!\n\n");
  } else {
    stdout.write("\n\n!----------!\n");
    stdout.write("Veuillez Entrer votre choix !");
    stdout.write("\n!----------!\n\n");
  }
}

void deleteAll() {
  stdout.write("\n\n!----------!\n");
  stdout.write("Etes vous sur de vouloir tous supprimer ?(Y/N)");
  String? confirmation = stdin.readLineSync();
  stdout.write("\n!----------!\n\n");

  if (confirmation != null && confirmation.isNotEmpty) {
    if (confirmation == 'Y' || confirmation == 'y') {
      tasks.clear();
      stdout.write("\n\n!----------!\n");
      stdout.write("Tous les taches ont ete supprimees avec succes !");
      stdout.write("\n!----------!\n\n");
    } else if (confirmation == 'N' || confirmation == 'n') {
      stdout.write("\n\n!----------!\n");
      stdout.write("Suppression annulee !");
      stdout.write("\n!----------!\n\n");
    } else {
      stdout.write("\n\n!----------!\n");
      stdout.write("Vueillez repondre par Y/N !");
      stdout.write("\n!----------!\n\n");
    }
  } else {
    stdout.write("\n\n!----------!\n");
    stdout.write("Vueillez repondre par Y/N !");
    stdout.write("\n!----------!\n\n");
  }
}
