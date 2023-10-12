// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learning_bloc/models/client.dart';

abstract class ClientEvent {}

class LoadClientEvent extends ClientEvent {}

class AddClientEvent extends ClientEvent {
  Client client;
  AddClientEvent({
    required this.client,
  });
}

class RemoveClientEvent extends ClientEvent {
  Client client;
  RemoveClientEvent({
    required this.client,
  });
}