import 'package:flutter/material.dart';
import 'package:flutter_uol_sample/main/todo.dart';

Future<Todo?> showCreateDialog({
  required BuildContext context,
  required Color color,
  Todo? todo,
}) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: CreateTodoDialog(
            todo: todo,
            color: color,
          ),
        );
      }
  );
}

class CreateTodoDialog extends StatefulWidget {
  const CreateTodoDialog({
    Key? key,
    this.todo,
    required this.color,
  }) : super(key: key);

  final Todo? todo;
  final Color color;

  @override
  State<CreateTodoDialog> createState() => _CreateTodoDialogState();
}

class _CreateTodoDialogState extends State<CreateTodoDialog> {

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();

    if (widget.todo != null) {
      _titleController.text = widget.todo!.title;
      _descriptionController.text = widget.todo!.description ?? '';
    }

    _titleController.addListener(() {
      setState(() {});
    });
    _descriptionController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool get enabled => _titleController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 16,),
          TextField(
            controller: _titleController,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'eg : Meeting with client',
                hintStyle: TextStyle(
                  color: Color(0xFFA9B0C5),
                )
            ),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              hintText: 'Description',
              hintStyle: TextStyle(
                color: Color(0xFFA9B0C5),
              )
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: enabled ? () {
                final now = DateTime.now();
                final object = widget.todo == null ? Todo(
                    id: now.millisecondsSinceEpoch,
                    title: _titleController.text,
                    description: _descriptionController.text,
                    color: widget.color,
                    createdAt: now,
                ) : Todo(
                    id: widget.todo!.id,
                    title: _titleController.text,
                    description: _descriptionController.text,
                    color: widget.todo!.color,
                    createdAt: widget.todo!.createdAt,
                );
                Navigator.pop(context, object);
              } : null,
              icon: Icon(
                Icons.send,
                color: const Color(0xFF24A19C).withOpacity(enabled ? 1.0 : 0.25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
