import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseTodoFormScreen extends ConsumerStatefulWidget {
  const BaseTodoFormScreen({super.key});

  @override
  ConsumerState<BaseTodoFormScreen> createState();
}

abstract class BaseTodoFormScreenState extends ConsumerState<BaseTodoFormScreen> {
  late final TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  Widget buildButton(BuildContext context);

  String get title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          TextField(controller: titleController),
          Builder(builder: buildButton)
        ],
      ),
    );
  }
}
