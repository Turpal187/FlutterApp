import 'package:admin/controllers/EmployeesController.dart';
import 'package:admin/models/EmployeeModel.dart';
import 'package:flutter/material.dart';
import 'package:admin/responsive.dart';
import 'package:admin/extension/timeofday_extension.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:intl/intl.dart';
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
  String _newEmployee = "${EmployeeModel.demoEmployees[0].surname} ${EmployeeModel.demoEmployees[0].name}";
  int _newTaskDuration = 0;

  DateTime _selectedDate = DateTime.now();
  final TextEditingController _dateController = new TextEditingController(text: DateFormat.yMd().format(DateTime.now()));

  TimeOfDay _selectedTime = TimeOfDay(hour: 00, minute: 00);
  final TextEditingController _timeController = new TextEditingController();

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
                      content: 
                      IntrinsicHeight(
                        child: Column(
                          children: [
                            TextField(
                              decoration: new InputDecoration(
                                hintText: "Title"
                              ),
                              onChanged: (String name) {
                                this._newTaskName = name;
                              },
                            ),
                            DropdownButton(
                              isExpanded: true,
                              value: '${this._controller.employees[0].surname} ${this._controller.employees[0].name}',
                              items: this._controller.employees.map((e) => DropdownMenuItem(value: '${e.surname} ${e.name}', child: Text('${e.surname!} ${e.name!}'))).toList(),
                              onChanged: (String? value)
                              {
                                _newEmployee = value!;
                              }
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                              decoration: new InputDecoration(
                                hintText: "Duration (min)"
                              ),
                              onChanged: (String duration) {
                                _newTaskDuration = int.parse(duration);
                              },
                            ),
                            SizedBox(height: defaultPadding),
                            TextField(
                              enabled: false,
                              controller: _dateController,
                            ),
                            TextField(
                              enabled: false,
                              controller: _timeController,
                            ),
                            SizedBox(height: defaultPadding),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  _selectDate(context);
                                }, 
                                child: Icon(Icons.date_range)
                              )
                            )
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(onPressed: () {
                          this._controller.addTask(this._newTaskName, this._newEmployee, this._dateController.text, this._timeController.text, this._newTaskDuration); // Send new task to controller singleton
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

  Future<Null> _selectDate(BuildContext context) async {
    
    final DateTime? _selected = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _selectedDate,
      lastDate: DateTime(2025)
    );

    if (_selected != null) {

      setState(() {

        _selectedDate = _selected;
        _dateController.text = DateFormat('yyy-MM-dd').format(_selected);
        _selectTime(context);

      });

    }

  }

  Future<Null> _selectTime(BuildContext context) async {

    final TimeOfDay? _selected = await showTimePicker(
      
      context: context, 
      initialTime: _selectedTime,
      builder: (BuildContext context, Widget? child) 
      {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!
        );
      }
      
    );

    if (_selected != null) {

      setState(() {

        _selectedTime = _selected;
        _timeController.text = _selectedTime.to24hours();

      });

    }

  }

}