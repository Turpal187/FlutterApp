import 'package:admin/models/EmployeeModel.dart';
import 'package:admin/services/google_sheets_api.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:admin/models/TaskModel.dart';

class EmployeesController extends ControllerMVC 
{
  static final EmployeesController _employeesController = EmployeesController._internal();
  factory EmployeesController() { return _employeesController; }

  EmployeesController._internal();

  List<Employee> get employees => EmployeeModel.demoEmployees;
  void add(Employee employee)
  {
    EmployeeModel.add(employee);
    GoogleSheetsApi.saveEmployee(employee);
  }

  void remove(Employee employee)
  {
    if (!TaskModel.isAssigned(employee))
    {
      EmployeeModel.remove(employee);
      GoogleSheetsApi.deleteEmployee(employee.id!);
    }
    else
    {
      print('Cannot delete employee because its assigned to a task...');
    }
  }
}