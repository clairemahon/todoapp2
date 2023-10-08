import 'package:flutter/material.dart';

// Task class that represents a task, including the title, description,
// date and time, as well as whether the task is completed.
class Task {
  final String title;
  final String description;
  final DateTime dateTime;
  bool completed;

  Task(this.title, this.description, this.dateTime, {this.completed = false});
}
