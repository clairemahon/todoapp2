import 'package:flutter/material.dart';
import 'main.dart';
import 'pendingTasks.dart';
import 'tasks.dart';

class CompletedTasks extends StatefulWidget {
  final List<Task> completedTasks;
  final List<Task> tasks;

  const CompletedTasks(
      {Key? key, required this.completedTasks, required this.tasks});

  @override
  _CompletedTasksState createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Tasks'),
      ),
      body: ListView.builder(
        itemCount: widget.completedTasks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(widget.completedTasks[index].title),
            subtitle: Text(widget.completedTasks[index].description),
            trailing: Text(widget.completedTasks[index].dateTime.toString()),
            onTap: () {
              setState(() {
                widget.completedTasks[index].completed = false;
                widget.tasks.add(widget.completedTasks[index]);
                widget.completedTasks.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
