import 'package:admin/services/uuid_generator.dart';

class EmployeeModel
{
  static List<Employee> get demoEmployees => EmployeeModel._demoEmployees;
  static Employee employee(String id) => EmployeeModel._demoEmployees.firstWhere((element) => element.id == id);

  static List<Employee> _demoEmployees = 
  [
    Employee(name: 'Taha', surname: 'Ulusoy', email: 'Ulusoy.Taha061@hotmail.com'),
    Employee(name: 'Turpal', surname: 'Dadaev', email: 'Ulusoy.Taha061@hotmail.com'),
  ];
}

class Employee
{
  String id = UuidGenerator.generate();
  String? name, surname, email;
  Employee({this.name, this.surname, this.email});

  @override
  String toString() => '${ this.surname } ${ this.name }';
}