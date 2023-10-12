import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/blocs/client_bloc.dart';
import 'package:learning_bloc/blocs/client_events.dart';
import 'package:learning_bloc/blocs/client_state.dart';
import 'package:learning_bloc/models/client.dart';
import 'package:learning_bloc/screen/home/components/client_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final ClientBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ClientBloc();
    bloc.add(LoadClientEvent());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  String randomName() {
    final rand = Random();
    return [
      "Maria Almeida",
      "Vinicius Silva",
      "Luiz Williams",
      "Bianca Nevis"
    ].elementAt(rand.nextInt(4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning Bloc"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              bloc.add(AddClientEvent(client: Client(name: randomName())));
            }, 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: BlocBuilder<ClientBloc, ClientState>(
        bloc: bloc,
        builder: (context, state) {
          // final clientsList = snapshot.data?.clients ?? [];
          if(state is ClientInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is ClientSuccessState) {
            final clientsList = state.clients;
            return ListView.builder(
              itemCount: clientsList.length,
              itemBuilder: (context, index) {
                return ClientList(
                  clientsList: clientsList,
                  index: index,
                  bloc: bloc,
                );
              },
            );
          }
          return Container();
        }
      ),
    );
  }
}