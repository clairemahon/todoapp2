import 'package:flutter/material.dart';
import 'main.dart';
import 'pending_tasks.dart';
import 'tasks.dart';
import 'tasks_list.dart';

// A widget that displays a list of completed tasks.
class CompletedTasks extends StatefulWidget {
  const CompletedTasks({Key? key});

  @override
  _CompletedTasksState createState() => _CompletedTasksState();
}

// Shows the current state of the completed task list,
// allowing a user to view the tasks they've already checked off.
class _CompletedTasksState extends State<CompletedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Tasks'),
      ),
      body: ListView.builder(
        itemCount: completedTasks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(completedTasks[index].title),
            subtitle: Text(completedTasks[index].description),
            trailing: Text(completedTasks[index].dateTime.toString()),
            onTap: () {
              setState(() {
                completedTasks[index].completed = false;
                tasks.add(completedTasks[index]);
                completedTasks.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
