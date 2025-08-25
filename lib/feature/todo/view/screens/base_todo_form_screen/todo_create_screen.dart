import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson69/feature/todo/view/screens/base_todo_form_screen/base_todo_form_screen.dart';
import 'package:lesson69/feature/todo/viewmodel/controllers/todo_create/todo_create_notifier.dart';
import 'package:lesson69/feature/todo/viewmodel/providers/todo_create_provider.dart';

class TodoCreateScreen extends BaseTodoFormScreen {
  const TodoCreateScreen({super.key});

  @override
  BaseTodoFormScreenState createState() => _TodoCreateScreenState();
}

class _TodoCreateScreenState extends BaseTodoFormScreenState {

  void _create() {
    ref
        .read(todoCreateProvider.notifier)
        .fetch(titleController.value.text.trim());
  }

  void _listen(TodoCreateState? prev, TodoCreateState next) {
    if (next is TodoCreateLoadedState) {
      Navigator.pop(context);
    } else if (next is TodoCreateExceptionState) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Произошла ошибка')));
    }
  }

  @override
  String get title => 'Создать таск';

  @override
  Widget buildButton(BuildContext context) {
    final todoCreateState = ref.watch(todoCreateProvider);
    return switch (todoCreateState) {
      TodoCreateInitialState() ||
      TodoCreateLoadedState() ||
      TodoCreateExceptionState() => ElevatedButton(
        onPressed: _create,
        child: Text('Создать'),
      ),
      TodoCreateLoadingState() => ElevatedButton(
        onPressed: () {},
        child: CupertinoActivityIndicator(),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(todoCreateProvider, _listen);
    return super.build(context);
  }
}
