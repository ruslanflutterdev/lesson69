import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson69/core/database/database.dart';
import 'package:lesson69/feature/todo/view/screens/base_todo_form_screen/base_todo_form_screen.dart';
import 'package:lesson69/feature/todo/viewmodel/controllers/todo_update/todo_update_notifier.dart';
import 'package:lesson69/feature/todo/viewmodel/providers/todo_update_provider.dart';

class TodoUpdateScreen extends BaseTodoFormScreen {
  const TodoUpdateScreen({super.key, required this.todo});

  final TodoTableData todo;

  @override
  BaseTodoFormScreenState createState() => _TodoUpdateScreenState();
}

class _TodoUpdateScreenState extends BaseTodoFormScreenState {
  @override
  TodoUpdateScreen get widget => super.widget as TodoUpdateScreen;

  @override
  void initState() {
    super.initState();
    titleController.value = TextEditingValue(text: widget.todo.title);
  }

  void _update() {
    ref
        .read(todoUpdateProvider.notifier)
        .fetch(widget.todo.id, titleController.value.text.trim());
  }

  void _listen(TodoUpdateState? prev, TodoUpdateState next) {
    if (next is TodoUpdateLoadedState) {
      Navigator.pop(context);
    } else if (next is TodoUpdateExceptionState) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Произошла ошибка')));
    }
  }

  @override
  String get title => 'Изменить таск';

  @override
  Widget buildButton(BuildContext context) {
    final todoUpdateState = ref.watch(todoUpdateProvider);
    return switch (todoUpdateState) {
      TodoUpdateInitialState() ||
      TodoUpdateLoadedState() ||
      TodoUpdateExceptionState() => ElevatedButton(
        onPressed: _update,
        child: Text('Изменить'),
      ),
      TodoUpdateLoadingState() => ElevatedButton(
        onPressed: () {},
        child: CupertinoActivityIndicator(),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(todoUpdateProvider, _listen);
    return super.build(context);
  }
}
