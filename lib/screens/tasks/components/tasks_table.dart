import 'package:admin/controllers/TaskController.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:admin/models/TaskModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../constants.dart';

class TasksTable extends StatefulWidget {

  final Function _notifyParent;

  TasksTable(this._notifyParent) : super();

  @override
  StateMVC<TasksTable> createState() => _TaskTableState(this._notifyParent);
}

class _TaskTableState extends StateMVC<TasksTable> {

  final Function _notifyParent;

  TaskController _controller = TaskController();

  _TaskTableState(this._notifyParent) : super();

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
                DataColumn2(
                  label: Text(""),
                  size: ColumnSize.S
                ),
              ],
              rows: List.generate(
                this._controller.tasks.length,
                (index) => taskDataRow(
                  
                  this._controller.tasks[index], 
                  (Task taskInstance) { this._controller.deleteTask(taskInstance); this._notifyParent(); }
                  
                ), // TaskDataRow()
              ),
            ),
          ),
        ],
      ),
    );
  }

}

DataRow taskDataRow(Task taskInfo, Function deleteMethod) {
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
      DataCell(
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(onPressed: () { deleteMethod(taskInfo); }, icon: Icon(Icons.delete)),
        )
      ),
    ],
  );
}