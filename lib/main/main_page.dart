import 'package:flutter/material.dart';
import 'package:flutter_uol_sample/main/empty_card.dart';
import 'package:flutter_uol_sample/main/main_card.dart';
import 'package:flutter_uol_sample/main/todo.dart';
import 'package:flutter_uol_sample/select/select_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
    required this.color,
  }) : super(key: key);

  final SelectColor color;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  late Map<int, Todo> _todo = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          // TODO: ON ADD
        },
        backgroundColor: const Color(0xFF24A19C),
        child: const Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Best platform for creating to-do lists',
                  style: TextStyle(
                    color: Color(0xFF767E8C),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                if (_todo.isEmpty) ...[
                  EmptyCard(
                    color: widget.color.color,
                  ),
                ] else ...[
                  Expanded(
                    child: ListView.builder(
                      itemCount: _todo.values.length,
                      itemBuilder: (context, index) {
                        final todo = _todo.values.toList()[index];
                        final key = todo.id;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: MainCard(
                            todo: todo,
                            onDelete: () {
                              _todo.remove(key);
                              setState(() {
                                _todo = _todo;
                              });
                            },
                            onUpdate: () {
                              // TODO: ON UPDATE
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
