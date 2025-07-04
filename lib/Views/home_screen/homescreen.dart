import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mucs/Data/blocs/homescreen/homepage/bloc/homescreen_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRud")),
      body: HomeScreenComponent(),
    );
  }
}

class HomeScreenComponent extends StatefulWidget {
  const HomeScreenComponent({super.key});

  @override
  State<HomeScreenComponent> createState() => _HomeScreenComponentState();
}

class _HomeScreenComponentState extends State<HomeScreenComponent> {
  @override
  void initState() {
    super.initState();
    //calling the event
    context.read<HomescreenBloc>().add(HomeScreenInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    //wraping the ui with bloc consumer
    return BlocConsumer<HomescreenBloc, HomescreenState>(
      listener: (context, state) {
        if (state is HomeScreenSucessState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("data Fetched")));
        }
      },
      //building things
      builder: (context, state) {
        if (state is HomeScreenLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeScreenSucessState) {
          final fetchedData = state.data;
          return ListView.builder(
            itemCount: fetchedData.length,
            itemBuilder: (context, index) {
              final item = fetchedData[index];
              return Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("Yes, it's working: ${item.toString()}"),
              );
            },
          );
        } else if (state is HomeScreenErrorState) {
          return Center(
            child: Text(
              "Error: ${state.errMsg}",
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const Center(child: Text("Waiting..."));
      },
    );
  }
}
