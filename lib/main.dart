import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'todoapp_theme.dart';
import 'home.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ToDoAppTheme.light();

    return MaterialApp(
      title: 'ToDoApp',
      theme: theme,
      home: const Home(),
    );
  }
}
