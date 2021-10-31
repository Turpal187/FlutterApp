import 'package:admin/screens/tasks/components/my_tasks.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:admin/models/MyTasks.dart';

import '../../../constants.dart';

class TasksTable extends StatelessWidget {
  const TasksTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tasks list",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Name"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("Status"),
                ),
              ],
              rows: List.generate(
                demoTasks.length,
                (index) => taskDataRow(demoTasks[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow taskDataRow(Task taskInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(taskInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(taskInfo.date!)),
      DataCell(Text(taskInfo.status!)),
    ],
  );
}