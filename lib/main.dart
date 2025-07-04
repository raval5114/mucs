import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mucs/Data/blocs/auth/bloc/sigin_bloc.dart';
import 'package:mucs/Data/blocs/homescreen/homepage/bloc/homescreen_bloc.dart';
import 'package:mucs/Views/auth/Signin/siginup.dart';
import 'package:mucs/Views/home_screen/homescreen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SiginBloc()),
        BlocProvider(create: (context) => HomescreenBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MUCS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SigninScreen(),
    );
  }
}
