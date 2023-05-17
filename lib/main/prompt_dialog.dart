import 'package:flutter/material.dart';
import 'package:flutter_uol_sample/main/todo.dart';

enum PromptResult {
  edit,
  delete
}

Future<PromptResult?> showPromptDialog({
  required BuildContext context,
  required Todo todo,
}) {
  return showDialog(
      context: context,
      builder: (context) => TodoPromptDialog(
        todo: todo,
      ),
  );
}

class TodoPromptDialog extends StatelessWidget {
  const TodoPromptDialog({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
            title: const Text(
              'Edit task',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
            onTap: () => Navigator.pop(context, PromptResult.edit),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            title: const Text(
              'Delete task',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
            onTap: () => Navigator.pop(context, PromptResult.delete),
          ),
        ],
      ),
    );
  }
}
