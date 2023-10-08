import 'package:flutter/material.dart';
import 'main.dart';
import 'tasks.dart';
import 'completed_tasks.dart';
import 'tasks_list.dart';

/// A widget that displays a list of pending tasks.
///
/// This widget displays a list of tasks that are pending. It allows the user to
/// mark a task as completed by checking the checkbox next to the task. The user
/// can also view the details of a task by tapping on the task.
class PendingTasks extends StatefulWidget {
  const PendingTasks({Key? key});

  @override
  _PendingTasksState createState() => _PendingTasksState();
}

// Shows the current state of the task list, allowing a user to add a new task,
//update the task list, and mark tasks as completed.
class _PendingTasksState extends State<PendingTasks> {
// Builds the widget for the pending tasks.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Tasks'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            title: Text(tasks[index].title),
            subtitle: Text(tasks[index].description),
            value: tasks[index].completed,
            onChanged: (bool? value) {
              setState(() {
                tasks[index].completed = value!;
                if (tasks[index].completed) {
                  completedTasks.add(tasks[index]);
                  tasks.removeAt(index);
                  print(completedTasks.length); // checking to see if tasks
                  // are being added (attempting to debug my load error)
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

// Shows a dialog that allows the user to add a new task.
  void _showAddTaskDialog(BuildContext context) {
    String title = '';
    String description = '';
    DateTime dateTime = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                onChanged: (value) {
                  description = value;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015, 8),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    final TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      dateTime = DateTime(
                        picked.year,
                        picked.month,
                        picked.day,
                        time.hour,
                        time.minute,
                      );
                    }
                  }
                },
                child: Text('Pick Date and Time'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  tasks.add(Task(title, description, dateTime));
                });
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
