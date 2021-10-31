import 'package:flutter/material.dart';
import 'components/my_tasks.dart';
import '../components/header.dart';
import 'components/tasks_table.dart';

import '../../constants.dart';

class TasksScreen extends StatelessWidget {
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
                      MyTasks(),
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