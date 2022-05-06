import 'package:admin/models/EmployeeModel.dart';

class TaskModel {

  static List<Task> get demoTasks => TaskModel._demoTasks;

  static void addTask(Task newTask) => TaskModel._demoTasks.add(newTask);
  static void deleteTask(Task delTask) => TaskModel._demoTasks.remove(delTask);
  static void editTask(Task task, String? statusValue) => TaskModel._demoTasks.singleWhere((element) => element == task).status = statusValue;

  static List<Task> _demoTasks = [
    Task(
      title: "Programming",
      employee: EmployeeModel.demoEmployees[0].id,
      date: "01-03-2021",
      time: "12:00 PM",
      duration: 60,
      status: "In Progress",
    ),
    Task(
      title: "Programming",
      employee: EmployeeModel.demoEmployees[0].id,
      date: "01-03-2021",
      time: "12:00 PM",
      duration: 60,
      status: "In Progress",
    ),
    Task(
      title: "Programming",
      employee: EmployeeModel.demoEmployees[0].id,
      date: "01-03-2021",
      time: "12:00 PM",
      duration: 60,
      status: "In Progress",
    ),
    Task(
      title: "Programming",
      employee: EmployeeModel.demoEmployees[1].id,
      date: "01-03-2021",
      time: "12:00 PM",
      duration: 60,
      status: "In Progress",
    ),
    Task(
      title: "Programming",
      employee: EmployeeModel.demoEmployees[1].id,
      date: "01-03-2021",
      time: "12:00 PM",
      duration: 60,
      status: "In Progress",
    ),
  ];
}

class Task {

  String? title, employee, date, time, status;
  int? duration;

  Task({this.title, this.employee, this.date, this.time, this.duration, this.status});

  Employee get assigned => EmployeeModel.employee(this.employee!);
}
