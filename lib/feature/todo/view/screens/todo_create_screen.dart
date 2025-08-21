import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson69/feature/todo/viewmodel/controllers/todo_create/todo_create_notifier.dart';
import 'package:lesson69/feature/todo/viewmodel/providers/todo_create_provider.dart';

class TodoCreateScreen extends ConsumerStatefulWidget {
  const TodoCreateScreen({super.key});

  @override
  ConsumerState<TodoCreateScreen> createState() => _TodoCreateScreenState();
}

class _TodoCreateScreenState extends ConsumerState<TodoCreateScreen> {
  late final TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _create() {
    ref
        .read(todoCreateProvider.notifier)
        .fetch(_titleController.value.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final todoCreateState = ref.watch(todoCreateProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Создать таск')),
      body: Column(
        children: [
          TextField(controller: _titleController),
          switch (todoCreateState) {
            TodoInitialState() || TodoLoadedlState() || TodoExceptionState() =>
              ElevatedButton(onPressed: _create, child: Text('Создать')),
            TodoLoadingState() => ElevatedButton(
              onPressed: () {},
              child: CupertinoActivityIndicator(),
            ),
          },
        ],
      ),
    );
  }
}
