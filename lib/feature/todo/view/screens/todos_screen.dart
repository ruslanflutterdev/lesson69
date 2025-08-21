import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson69/feature/todo/viewmodel/controllers/todos/todos_notifier.dart';
import 'package:lesson69/feature/todo/viewmodel/providers/todos_provider.dart';

import '../../../../core/navigator/routes.dart';

class TodosScreen extends ConsumerStatefulWidget {
  const TodosScreen({super.key});

  @override
  ConsumerState<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends ConsumerState<TodosScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetch();
    });
  }

  void _fetch() {
    ref.read(todosProvider.notifier).fetch();
  }

  Future<void> _toCreateTodo() async{
    await Navigator.pushNamed(context, Routes.create);
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    final todosState = ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: _toCreateTodo, icon: Icon(Icons.add))],
      ),
      body: switch (todosState) {
        TodosLoadingState() ||
        TodosInitialState() => Center(child: CupertinoActivityIndicator()),

        TodosLoadedlState() => ListView.builder(
          itemCount: todosState.todos.length,
          itemBuilder: (context, index) {
            final todo = todosState.todos[index];
            return ListTile(title: Text(todo.title),);
          },
        ),

        TodosExceptionState() => Text('Exception'),
      },
    );
  }
}
