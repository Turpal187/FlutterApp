import 'package:admin/constants.dart';
import 'package:admin/controllers/EmployeesController.dart';
import 'package:admin/models/EmployeeModel.dart';
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

  EmployeesController _controller = EmployeesController();
  _EmployeesTableState() : super();

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
                  label: Text("Surname"),
                ),
                DataColumn(
                  label: Text("Email"),
                ),
              ],
              rows: List.generate
              (
                this._controller.employees.length, 
                (index) => employeeDataRow
                (
                  context, 
                  this._controller.employees[index]
                )
              )// TaskDataRow()
            ),
          ),
        ],
      ),
    );
  }
}

DataRow employeeDataRow(BuildContext context, Employee employee) 
{
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(employee.name!),
            ),
          ],
        ),
      ),
      DataCell(Text(employee.surname!)),
      DataCell(Text(employee.email!)),
    ],
  );
}