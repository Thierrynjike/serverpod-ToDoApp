/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import

import 'dart:io';
import 'dart:typed_data' as typed_data;
import 'package:serverpod_client/serverpod_client.dart';
import 'protocol.dart';

class _EndpointTask extends EndpointRef {
  @override
  String get name => 'task';

  _EndpointTask(EndpointCaller caller) : super(caller);

  Future<String> delete(
    dynamic myTask,
  ) async {
    return await caller.callServerEndpoint('task', 'delete', 'String', {
      'myTask': myTask,
    });
  }

  Future<String> deletelike(
    String ltd,
  ) async {
    return await caller.callServerEndpoint('task', 'deletelike', 'String', {
      'ltd': ltd,
    });
  }

  Future<String> add(
    dynamic myTask,
  ) async {
    return await caller.callServerEndpoint('task', 'add', 'String', {
      'myTask': myTask,
    });
  }

  Future<dynamic> findbyname(
    String name,
  ) async {
    return await caller.callServerEndpoint('task', 'findbyname', 'dynamic', {
      'name': name,
    });
  }

  Future<List<Task>> findall() async {
    return await caller.callServerEndpoint('task', 'findall', 'List<Task>', {});
  }

  Future<String> display(
    dynamic task,
  ) async {
    return await caller.callServerEndpoint('task', 'display', 'String', {
      'task': task,
    });
  }
}

class Client extends ServerpodClient {
  late final _EndpointTask task;

  Client(String host,
      {SecurityContext? context,
      ServerpodClientErrorCallback? errorHandler,
      AuthenticationKeyManager? authenticationKeyManager})
      : super(host, Protocol.instance,
            context: context,
            errorHandler: errorHandler,
            authenticationKeyManager: authenticationKeyManager) {
    task = _EndpointTask(this);
  }

  @override
  Map<String, EndpointRef> get endpointRefLookup => {
        'task': task,
      };

  @override
  Map<String, ModuleEndpointCaller> get moduleLookup => {};
}
