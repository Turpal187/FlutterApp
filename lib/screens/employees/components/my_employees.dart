import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class MyEmployees extends StatefulWidget 
{

  MyEmployees() : super();

  @override
  StateMVC<MyEmployees> createState() => _MyEmployeesState();
  
}

class _MyEmployeesState extends StateMVC<MyEmployees> 
{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Employees",
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
              icon: Icon(Icons.add),
              label: Text("Add New"),
              onPressed: ()
              {
                print('add new employee please...');
              },
            ),
          ]
        )
      ],
    );
  }
}