import 'package:flutter/material.dart';
import 'package:admin/models/TaskModel.dart';
import 'package:admin/controllers/TaskController.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class TaskEditor extends StatefulWidget
{
  
  final Task _task;
  final Function _notifyParent;

  TaskEditor(this._task, this._notifyParent) : super();

  @override
  StateMVC<TaskEditor> createState() => _TaskEditorState();
}

class _TaskEditorState extends StateMVC<TaskEditor>
{

  late final TaskStatusDropdown _dropdown;

  @override
  void initState()
  {
    super.initState();
    this._dropdown = TaskStatusDropdown(widget._task.status);
  }

  TaskController _controller = TaskController();

  _TaskEditorState(): super();

  @override
  Widget build(BuildContext context)
  {
    return AlertDialog(

      title: Text("Edit task"),
      content: this._dropdown,
      actions: <Widget>[

        TextButton(onPressed: () {

          this._controller.editTask(widget._task, this._dropdown.selectedValue);
          widget._notifyParent();
          Navigator.of(context).pop();
        
        },
        child: Text("Ok"),
        ),

      ],

    );
  }
}

class TaskStatusDropdown extends StatefulWidget
{

  final String? _initValue;
  String? _selectedValue;
  String? get selectedValue => this._selectedValue;

  TaskStatusDropdown(this._initValue): super();

  @override
  State<TaskStatusDropdown> createState() => _TaskStatusDropdownState(this._initValue);
}

class _TaskStatusDropdownState extends State<TaskStatusDropdown>
{

  final String? _initValue;

  _TaskStatusDropdownState(this._initValue): super();

  @override
  Widget build(BuildContext context)
  {
    return DropdownButton(

      value: this._initValue,
      items: <String>['In Progress', 'Test'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {

        setState(() 
        {

          widget._selectedValue = value;

        });

      },

    );
  }
}