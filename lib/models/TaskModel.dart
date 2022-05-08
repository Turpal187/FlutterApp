import 'package:admin/models/EmployeeModel.dart';
import 'package:admin/services/uuid_generator.dart';

class TaskModel 
{

  static List<Task> get demoTasks => TaskModel._demoTasks;

  static void addTask(Task newTask) => TaskModel._demoTasks.add(newTask);
  static void deleteTask(Task delTask) => TaskModel._demoTasks.remove(delTask);
  static void editTask(Task task, String? statusValue) => TaskModel._demoTasks.singleWhere((element) => element == task).status = statusValue;

  static List<Task> _demoTasks = [];
}

class Task 
{

  String? id, title, employee, date, time, status;
  int? duration;

  Task({this.title, this.employee, this.date, this.time, this.duration, this.status}) { this.id = UuidGenerator.generate(); }
  Task.fromSync({this.id, this.title, this.employee, this.date, this.time, this.duration, this.status});

  Employee get assigned => EmployeeModel.employee(this.employee!);
}
