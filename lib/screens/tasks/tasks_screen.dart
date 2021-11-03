import 'package:flutter/material.dart';
import 'components/my_tasks.dart';
import '../components/header.dart';
import 'components/tasks_table.dart';
import '../../models/TaskModel.dart';

import '../../constants.dart';

class TasksScreen extends StatefulWidget {

  @override
  State<TasksScreen> createState() => _TasksScreenState();

}

class _TasksScreenState extends State<TasksScreen> {

  void _changeNotification() => this.setState(() {}); /// Updated when child notifies parent

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [

            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyTasks(this._changeNotification), /// Send _changeNotification function pointer to child
                      SizedBox(height: defaultPadding),
                      TasksTable(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}