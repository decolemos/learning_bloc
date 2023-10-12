// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:learning_bloc/blocs/client_bloc.dart';
import 'package:learning_bloc/blocs/client_events.dart';
import 'package:learning_bloc/models/client.dart';

class ClientList extends StatelessWidget {

  final List<Client> clientsList;
  final int index;
  final ClientBloc bloc;

  const ClientList({
    Key? key,
    required this.clientsList,
    required this.index,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: ClipRRect(
            child: Text(clientsList[index].name.substring(0, 1)),
          ),
        ),
        title: Text(clientsList[index].name),
        trailing: IconButton(
          onPressed: () {
            bloc.add(RemoveClientEvent(client: clientsList[index]));
          }, 
          icon: const Icon(Icons.delete),
          color: Colors.red,
        ),
      ),
    );
  }
}
