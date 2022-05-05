import 'package:admin/models/TaskModel.dart';
import 'package:admin/models/EmployeeModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:admin/services/google_calendar_api.dart';

class TaskController extends ControllerMVC {

  static final TaskController _taskController = TaskController._internal();
  factory TaskController() { return _taskController; }

  TaskController._internal();

  List<Task> get tasks => TaskModel.demoTasks;
  List<Employee> get employees => EmployeeModel.demoEmployees;
  
  void deleteTask(Task task) => TaskModel.deleteTask(task);
  void editTask(Task task, String? statusValue) => TaskModel.editTask(task, statusValue);

  void addTask(String name, String employee, String date, String time, int duration)
  {
    TaskModel.addTask(Task(title: name, employee: employee, date: date, time: time, duration: duration, status: "In Progress")); // Add task to DataBase
    DateTime startDate = DateTime.parse(date + ' ' + time + ':00');
    GoogleCalendarApi.addCalendarEvent(name, startDate, startDate.add(Duration(minutes: duration))); // Add task to Google Calendar
  }

}