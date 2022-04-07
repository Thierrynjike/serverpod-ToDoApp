import 'package:talkpod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TaskEndpoint extends Endpoint {
  Future<String> delete(Session session, Task myTask) async {
    // Delete a single row
    try {
      await Task.deleteRow(session, myTask);
      return ("row deleted");
    } catch (e) {
      return ('$e');
    }
  }

  // Delete all rows where the company name ends with 'Ltd'
  Future<String> deletelike(Session session, String ltd) async {
    try {
      await Task.delete(
        session,
        where: (t) => t.name.like('%ltd'),
      );
      return ("rows deleted");
    } catch (e) {
      return ('$e');
    }
  }

  Future<String> add(Session session, Task myTask) async {
    try {
      await Task.insert(session, myTask);
      return ("row added");
    } catch (e) {
      return ('$e');
    }
  }

  Future<dynamic> findbyname(Session session, String name) async {
    try {
      var myTask = await Task.findSingleRow(
        session,
        where: (t) => t.assignedTo.equals(name),
      );

      return myTask;
    } catch (e) {
      return ('$e');
    }
  }

  Future<Tasks> findall(Session session) async {
    try {
      Tasks tasks = new Tasks(list: await Task.find(session));

      return tasks;
    } catch (e) {
      return new Tasks(list: []);
    }
  }

  Future<String> display(Session session, Task task) async {
    String out = "Informations de la tâche \n";
    out += "---------------------------------------\n";

    out +=
        "Nom: ${task.name}\ndescription: ${task.description}\ncreation date: ${task.creationDate}\nResponsable: ${task.assignedTo}\n";

    return out;
  }
}
