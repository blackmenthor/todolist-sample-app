import 'package:flutter/material.dart';
import 'package:flutter_uol_sample/main/prompt_dialog.dart';
import 'package:flutter_uol_sample/main/todo.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
    required this.todo,
    required this.onDelete,
    required this.onUpdate,
  }) : super(key: key);

  final Todo todo;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 6,
      surfaceTintColor: Colors.white,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16),
            width: double.infinity,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: todo.color,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '#${todo.id}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final result = await showPromptDialog(context: context, todo: todo);
                    switch (result) {
                      case PromptResult.edit: return onUpdate();
                      case PromptResult.delete: return onDelete();
                      default: return;
                    }
                  },
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                if (todo.description != null) ...[
                  const SizedBox(height: 8,),
                  Text(
                    todo.description!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF767E8C),
                    ),
                  ),
                ],
                const SizedBox(height: 8,),
                const Divider(),
                Text(
                  todo.createdAt.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF767E8C),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
