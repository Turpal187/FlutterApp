import 'package:admin/services/uuid_generator.dart';

class EmployeeModel
{
  static List<Employee> get demoEmployees => EmployeeModel._demoEmployees;
  static Employee employee(String id) => EmployeeModel._demoEmployees.firstWhere((element) => element.id == id);
  static void add(Employee employee) => EmployeeModel._demoEmployees.add(employee);
  static void remove(Employee employee) => EmployeeModel._demoEmployees.remove(employee);

  static List<Employee> _demoEmployees = [];
}

class Employee
{
  String? id, name, surname, email;

  Employee({this.name, this.surname, this.email}) { this.id = UuidGenerator.generate(); }
  Employee.fromSync({this.id, this.name, this.surname, this.email});

  @override
  String toString() => '${ this.surname } ${ this.name }';
}