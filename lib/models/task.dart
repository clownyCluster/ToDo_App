
class Task {
  final String name;
  bool taskDone;

  Task({this.name, this.taskDone=false});

  void toogleDone() {
    taskDone = !taskDone;
  }
}
