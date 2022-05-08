import 'package:admin/models/EmployeeModel.dart';
import 'package:admin/services/google_sheets_api.dart';

class TaskModel {

  static List<Task> get demoTasks => TaskModel._demoTasks;

  static void addTask(Task newTask) => TaskModel._demoTasks.add(newTask);
  static void saveTask(Task newTask) => GoogleSheetsApi.saveTask(newTask);
  static void deleteTask(Task delTask) => TaskModel._demoTasks.remove(delTask);
  static void editTask(Task task, String? statusValue) => TaskModel._demoTasks.singleWhere((element) => element == task).status = statusValue;

  static List<Task> _demoTasks = [];
}

class Task {

  String? title, employee, date, time, status;
  int? duration;

  Task({this.title, this.employee, this.date, this.time, this.duration, this.status});

  Employee get assigned => EmployeeModel.employee(this.employee!);
}
