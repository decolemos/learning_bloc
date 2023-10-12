// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learning_bloc/models/client.dart';

abstract class ClientState {
  List<Client> clients;
  ClientState({
    required this.clients,
  });
}

class ClientInitialState extends ClientState {
  ClientInitialState() : super(clients: []);
}

class ClientSuccessState extends ClientState {
  ClientSuccessState({required List<Client> clients}) : super(clients: clients);
}

class ClientErrorState extends ClientState {
  String errorMessage;
  ClientErrorState({
    required this.errorMessage, required super.clients,
  });
}
