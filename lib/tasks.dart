import 'package:flutter/material.dart';

class Task {
  final String title;
  final String description;
  final DateTime dateTime;
  bool completed;

  Task(this.title, this.description, this.dateTime, {this.completed = false});
}