/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unnecessary_import
// ignore_for_file: unused_import

import 'dart:typed_data' as typed_data;
import 'package:serverpod/serverpod.dart';

import 'protocol.dart';

import '../endpoints/task_endpoint.dart';

class Endpoints extends EndpointDispatch {
  @override
  void initializeEndpoints(Server server) {
    var endpoints = <String, Endpoint>{
      'task': TaskEndpoint()..initialize(server, 'task', null),
    };

    connectors['task'] = EndpointConnector(
      name: 'task',
      endpoint: endpoints['task']!,
      methodConnectors: {
        'delete': MethodConnector(
          name: 'delete',
          params: {
            'myTask': ParameterDescription(
                name: 'myTask', type: Task, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['task'] as TaskEndpoint).delete(
              session,
              params['myTask'],
            );
          },
        ),
        'deletelike': MethodConnector(
          name: 'deletelike',
          params: {
            'ltd': ParameterDescription(
                name: 'ltd', type: String, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['task'] as TaskEndpoint).deletelike(
              session,
              params['ltd'],
            );
          },
        ),
        'add': MethodConnector(
          name: 'add',
          params: {
            'myTask': ParameterDescription(
                name: 'myTask', type: Task, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['task'] as TaskEndpoint).add(
              session,
              params['myTask'],
            );
          },
        ),
        'findbyname': MethodConnector(
          name: 'findbyname',
          params: {
            'name': ParameterDescription(
                name: 'name', type: String, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['task'] as TaskEndpoint).findbyname(
              session,
              params['name'],
            );
          },
        ),
        'findall': MethodConnector(
          name: 'findall',
          params: {},
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['task'] as TaskEndpoint).findall(
              session,
            );
          },
        ),
        'display': MethodConnector(
          name: 'display',
          params: {
            'task':
                ParameterDescription(name: 'task', type: Task, nullable: false),
          },
          call: (Session session, Map<String, dynamic> params) async {
            return (endpoints['task'] as TaskEndpoint).display(
              session,
              params['task'],
            );
          },
        ),
      },
    );
  }

  @override
  void registerModules(Serverpod pod) {}
}
