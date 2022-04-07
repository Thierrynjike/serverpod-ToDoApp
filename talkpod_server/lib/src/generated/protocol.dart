/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unnecessary_import

library protocol;

// ignore: unused_import
import 'dart:typed_data';
import 'package:serverpod/serverpod.dart';

import 'task_class.dart';
import 'tasks_class.dart';

export 'task_class.dart';
export 'tasks_class.dart';

class Protocol extends SerializationManagerServer {
  static final Protocol instance = Protocol();

  final Map<String, constructor> _constructors = {};
  @override
  Map<String, constructor> get constructors => _constructors;

  final Map<String, String> _tableClassMapping = {};
  @override
  Map<String, String> get tableClassMapping => _tableClassMapping;

  final Map<Type, Table> _typeTableMapping = {};
  @override
  Map<Type, Table> get typeTableMapping => _typeTableMapping;

  Protocol() {
    constructors['Task'] = (Map<String, dynamic> serialization) =>
        Task.fromSerialization(serialization);
    constructors['Tasks'] = (Map<String, dynamic> serialization) =>
        Tasks.fromSerialization(serialization);

    tableClassMapping['task'] = 'Task';
    typeTableMapping[Task] = Task.t;
  }
}
