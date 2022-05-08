import 'package:admin/constants.dart';
import 'package:admin/screens/employees/components/employees_table.dart';
import 'package:admin/screens/employees/components/my_employees.dart';
import 'package:flutter/cupertino.dart';
import 'package:admin/screens/components/header.dart';

class EmployeesScreen extends StatefulWidget
{
  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header("Employees"),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyEmployees(() => this.setState(() {})),
                      SizedBox(height: defaultPadding),
                      EmployeesTable(),
                    ],
                  ),
                ),
              ],
            ),
          ],)
      ),
    );
  }
}