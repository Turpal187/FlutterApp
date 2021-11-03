import 'package:flutter/material.dart';
import 'package:admin/responsive.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../controllers/TaskController.dart';

import '../../../constants.dart';

class MyTasks extends StatefulWidget {

  final Function _notifyParent;

  MyTasks(this._notifyParent) : super();

  @override
  StateMVC<MyTasks> createState() => _MyTasksState(this._notifyParent);
  
}

class _MyTasksState extends StateMVC<MyTasks> {

  TaskController _controller = TaskController();
  final Function _notifyParent;

  String _newTaskName = "";

  _MyTasksState(this._notifyParent) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Tasks",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Add task"),
                      content: TextField(
                        onChanged: (String name) {
                          this._newTaskName = name;
                        },
                      ),
                      actions: <Widget>[
                        TextButton(onPressed: () {
                          this._controller.addTask(this._newTaskName); // Send new task to controller singleton
                          this._notifyParent(); // Notify parent of changes
                          Navigator.of(context).pop(); // Pop the popup dialog from the widget stack after adding task item
                        },
                        child: Text("Add"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.add),
              label: Text("Add New"),
            ),
          ],
        ),
      ],
    );
  }

}