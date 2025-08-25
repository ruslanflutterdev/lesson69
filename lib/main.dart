import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson69/core/database/database.dart';
import 'package:lesson69/core/navigator/routers.dart';
import 'package:lesson69/feature/todo/view/screens/base_todo_form_screen/todo_create_screen.dart';
import 'package:lesson69/feature/todo/view/screens/base_todo_form_screen/todo_update_screen.dart';
import 'package:lesson69/feature/todo/view/screens/todos_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.home: (context) => TodosScreen(),
          Routes.create: (context) => TodoCreateScreen(),
          Routes.update: (context) => TodoUpdateScreen(
            todo: ModalRoute.settingsOf(context)?.arguments as TodoTableData,
          ),
        },
      ),
    );
  }
}
