import 'package:flutter/material.dart';
import 'completedTasks.dart';
import 'pendingTasks.dart';
import 'tasks.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  var selectedIndex = 0;

  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const PendingTasks();
        break;
      case 1:
        page = const CompletedTasks(completedTasks: [], tasks: []);
        break;
      default:
        throw UnimplementedError('No page for index $selectedIndex ');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth > 600,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.checklist),
                    label: Text('Pending Tasks'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.check),
                    label: Text('Completed Tasks'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
