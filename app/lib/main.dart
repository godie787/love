import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home_screen.dart';
import 'screens/notes/notes_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotesBloc(),
      child: MaterialApp(
        title: 'Nuestra App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
