import 'package:admin/constants.dart';
import 'package:admin/controllers/EmployeesController.dart';
import 'package:admin/models/EmployeeModel.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class MyEmployees extends StatefulWidget 
{

  final Function _notifyParent;

  MyEmployees(this._notifyParent) : super();

  @override
  StateMVC<MyEmployees> createState() => _MyEmployeesState();
  
}

class _MyEmployeesState extends StateMVC<MyEmployees> 
{

  EmployeesController _controller = new EmployeesController();
  _MyEmployeesState() : super();

  @override
  void initState() => super.initState();

  String? _newName;
  String? _newSurname;
  String? _newEmail;

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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Add employee"),
                      content: 
                      IntrinsicHeight(
                        child: Column(
                          children: [
                            TextField(
                              decoration: new InputDecoration(
                                hintText: "name"
                              ),
                              onChanged: (String name) {
                                this._newName = name;
                              },
                            ),
                            SizedBox(height: defaultPadding),
                            TextField(
                              decoration: new InputDecoration(
                                hintText: "surname"
                              ),
                              onChanged: (String surname) {
                                this._newSurname = surname;
                              },
                            ),
                            SizedBox(height: defaultPadding),
                            TextField(
                              decoration: new InputDecoration(
                                hintText: "email"
                              ),
                              onChanged: (String email) {
                                this._newEmail = email;
                              },
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(onPressed: () {
                          // Notify parent of changes
                          this._controller.add(new Employee(name: this._newName, surname: this._newSurname, email: this._newEmail));
                          Navigator.of(context).pop(); 
                          widget._notifyParent();
                        },
                        child: Text("Add"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ]
        )
      ],
    );
  }
}