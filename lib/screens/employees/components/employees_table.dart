import 'package:admin/constants.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class EmployeesTable extends StatefulWidget {

  EmployeesTable() : super();

  @override
  StateMVC<EmployeesTable> createState() => _EmployeesTableState();
}

class _EmployeesTableState extends StateMVC<EmployeesTable> 
{
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
                  label: Text("Time"),
                ),
                DataColumn(
                  label: Text("Status"),
                ),
                DataColumn2(
                  label: Text(""),
                  size: ColumnSize.S
                ),
              ],
              rows: [],// TaskDataRow()
            ),
          ),
        ],
      ),
    );
  }
}