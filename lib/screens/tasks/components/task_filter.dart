import 'package:flutter/material.dart';

class TaskFilter extends StatefulWidget {

  @override
  State<TaskFilter> createState() => _TaskFilterState();
}

class _TaskFilterState extends State<TaskFilter> {


  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Filter",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            DropdownButton(
              value: "In Progress",
              items: <String>['In Progress', 'Completed'].map<DropdownMenuItem<String>>((String value) {

                return DropdownMenuItem<String>(value: value, child: Text(value));

              }).toList(),
            )
          ],
        )

      ],

    );

  }
}