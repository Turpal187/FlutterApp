import 'package:admin/models/EmployeeModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class EmployeesController extends ControllerMVC 
{
  static final EmployeesController _employeesController = EmployeesController._internal();
  factory EmployeesController() { return _employeesController; }

  EmployeesController._internal();

  List<Employee> get tasks => EmployeeModel.demoEmployees;
}