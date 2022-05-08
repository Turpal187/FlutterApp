import 'package:admin/models/EmployeeModel.dart';
import 'package:admin/services/google_sheets_api.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

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
    EmployeeModel.remove(employee);
    GoogleSheetsApi.deleteEmployee(employee.id!);
  }
}