class EmployeeModel
{
  static List<Employee> get demoEmployees => EmployeeModel._demoEmployees;

  static List<Employee> _demoEmployees = [
    Employee(name: 'Taha', surname: 'Ulusoy', email: 'Ulusoy.Taha061@hotmail.com'),
    Employee(name: 'Turpal', surname: 'Dadaev', email: 'Ulusoy.Taha061@hotmail.com'),
  ];
}

class Employee
{
  String? name, surname, email;
  Employee({this.name, this.surname, this.email});
}