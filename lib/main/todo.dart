import 'package:flutter/material.dart';

class Todo {
  final int id;
  final String title;
  final String? description;
  final Color color;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    this.description,
    required this.color,
    required this.createdAt,
  });
}
