import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:learning_bloc/blocs/client_events.dart';
import 'package:learning_bloc/blocs/client_state.dart';
import 'package:learning_bloc/models/client.dart';
import 'package:learning_bloc/repositorys/clients_repository.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final _clientRepository = ClientsRepository();

  // final StreamController<ClientEvent> _inputClientController = StreamController<ClientEvent>();
  // final StreamController<ClientState> _outputClientController = StreamController<ClientState>();

  // Sink<ClientEvent> get inputClient => _inputClientController.sink;
  // Stream<ClientState> get outputClient => _outputClientController.stream;

  ClientBloc() : super(ClientInitialState()) {
    // _inputClientController.stream.listen(_mapEventToState);
    on<LoadClientEvent>(
      (event, emit) => emit(ClientSuccessState(clients: _clientRepository.loadClients())),
    );
    on<AddClientEvent>(
      (event, emit) => emit(ClientSuccessState(clients: _clientRepository.addClient(event.client))),
    );
    on<RemoveClientEvent>(
      (event, emit) => emit(ClientSuccessState(clients: _clientRepository.removeClient(event.client))),
    );
  }

  // _mapEventToState(ClientEvent event) {
  //   List<Client> clients = [];
  //   if(event is LoadClientEvent) {
  //     clients = _clientRepository.loadClients();
  //   } else if(event is AddClientEvent) {
  //     clients = _clientRepository.addClient(event.client);
  //   } else if(event is RemoveClientEvent) {
  //     clients = _clientRepository.removeClient(event.client);
  //   }
  //   _outputClientController .add(ClientSuccessState(clients: clients));
  // }

}