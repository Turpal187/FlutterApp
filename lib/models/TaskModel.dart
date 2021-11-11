class TaskModel {

  static List<Task> get demoTasks => TaskModel._demoTasks;

  static void addTask(Task newTask) => TaskModel._demoTasks.add(newTask);
  static void deleteTask(Task delTask) => TaskModel._demoTasks.remove(delTask);
  static void editTask(Task task, String? statusValue) => TaskModel._demoTasks.singleWhere((element) => element == task).status = statusValue;

  static List<Task> _demoTasks = [
    Task(
      title: "Programming",
      date: "01-03-2021",
      time: "12:00 PM",
      status: "In Progress",
    ),
    Task(
      title: "Programming",
      date: "01-03-2021",
      time: "12:00 PM",
      status: "In Progress",
    ),
    Task(
      title: "Programming",
      date: "01-03-2021",
      time: "12:00 PM",
      status: "In Progress",
    ),
    Task(
      title: "Programming",
      date: "01-03-2021",
      time: "12:00 PM",
      status: "In Progress",
    ),
    Task(
      title: "Programming",
      date: "01-03-2021",
      time: "12:00 PM",
      status: "In Progress",
    ),
  ];

  
}

class Task {

  String? title, date, time, status;

  Task({this.title, this.date, this.time, this.status});
}
