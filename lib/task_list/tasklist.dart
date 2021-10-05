import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'tilelist.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  TaskList(this.tasks);
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: widget.tasks[index].name,
            isChecked: widget.tasks[index].taskDone,
            checkboxCallback: (CheckboxState) {
              setState(() {
                widget.tasks[index].toogleDone();
              });
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}
