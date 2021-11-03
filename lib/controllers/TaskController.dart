import 'package:admin/models/TaskModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class TaskController extends ControllerMVC {

  static final TaskController _taskController = TaskController._internal();

  factory TaskController()
  {
    return _taskController;
  }

  TaskController._internal();

  List<Task> get tasks => TaskModel.demoTasks;
  void addTask(String name) => TaskModel.addTask(Task(title: name, date: DateTime.now().toString(), status: "In Progress"));
  void deleteTask(Task task) => TaskModel.deleteTask(task);

}