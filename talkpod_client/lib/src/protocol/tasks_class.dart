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

class Tasks extends SerializableEntity {
  @override
  String get className => 'Tasks';

  int? id;
  late List<Task> list;

  Tasks({
    this.id,
    required this.list,
  });

  Tasks.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    list = _data['list']!.map<Task>((a) => Task.fromSerialization(a))?.toList();
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'list': list.map((Task a) => a.serialize()).toList(),
    });
  }
}
