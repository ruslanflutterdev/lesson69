import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson69/feature/todo/view/screens/todo_create_screen.dart';
import 'package:lesson69/feature/todo/view/screens/todos_screen.dart';

import 'core/navigator/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.home: (context) => TodosScreen(),
          Routes.create: (context) => TodoCreateScreen(),
        },
      ),
    );
  }
}


