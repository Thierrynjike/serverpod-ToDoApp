/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: overridden_fields

import 'package:serverpod_client/serverpod_client.dart';
import 'dart:typed_data';
import 'protocol.dart';

class Task extends SerializableEntity {
  @override
  String get className => 'Task';

  int? id;
  late String name;
  late String description;
  DateTime? creationDate;
  late String assignedTo;

  Task({
    this.id,
    required this.name,
    required this.description,
    this.creationDate,
    required this.assignedTo,
  });

  Task.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    name = _data['name']!;
    description = _data['description']!;
    creationDate = _data['creationDate'] != null
        ? DateTime.tryParse(_data['creationDate'])
        : null;
    assignedTo = _data['assignedTo']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'name': name,
      'description': description,
      'creationDate': creationDate?.toUtc().toIso8601String(),
      'assignedTo': assignedTo,
    });
  }
}
