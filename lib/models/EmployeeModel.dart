import 'package:admin/services/uuid_generator.dart';
import 'package:admin/services/google_sheets_api.dart';

class EmployeeModel
{
  static List<Employee> get demoEmployees => EmployeeModel._demoEmployees;
  static Employee employee(String id) => EmployeeModel._demoEmployees.firstWhere((element) => element.id == id);
  static void add(Employee employee) => EmployeeModel._demoEmployees.add(employee);
  static void save(Employee employee) => GoogleSheetsApi.saveEmployee(employee);

  static List<Employee> _demoEmployees = [];
}

class Employee
{
  String id = UuidGenerator.generate();
  String? name, surname, email;
  Employee({this.name, this.surname, this.email});

  @override
  String toString() => '${ this.surname } ${ this.name }';
}