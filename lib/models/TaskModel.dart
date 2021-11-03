class TaskModel {

  static List<Task> get demoTasks => TaskModel._demoTasks;

  static void addTask(Task newTask) => TaskModel._demoTasks.add(newTask);
  static void deleteTask(Task delTask) => TaskModel._demoTasks.remove(delTask);

  static List<Task> _demoTasks = [
    Task(
      title: "Programming",
      date: "01-03-2021",
      status: "Completed",
    ),
    Task(
      title: "Programming",
      date: "01-03-2021",
      status: "Completed",
    ),
    Task(
      title: "Programming",
      date: "01-03-2021",
      status: "Completed",
    ),
    Task(
      title: "Programming",
      date: "01-03-2021",
      status: "Completed",
    ),
    Task(
      title: "Programming",
      date: "01-03-2021",
      status: "Completed",
    ),
  ];

  
}

class Task {

  final String? title, date, status;

  Task({this.title, this.date, this.status});
}
