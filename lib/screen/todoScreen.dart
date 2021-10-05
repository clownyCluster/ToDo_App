import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screen/add_task_screen.dart';
import 'package:todo_app/task_list/tasklist.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<Task> tasks = [];
  // Widget bottomSheetWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            // isScrollControlled: true,
            builder: (context) => AddTaskScreen((newTaskTitle) {
              setState(() {
                tasks.add(Task(name: newTaskTitle));
              });
            }),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 30, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 25,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'TODO APP',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${tasks.length} tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: TaskList(tasks),
            ),
          ),
        ],
      ),
    );
  }
}
