//This should be used to Test json.decode,
import 'package:ingenio/domain/entities/ingenio_item.dart';

String mockDataJSON = '''
[
  {
    "avatar":
        "",
    "bio":
        "Mock Bio Description",
    "firstName": "John",
    "id": "9999",
    "lastName": "Doe",
    "title": "Jack of All Trades"
  }
]
''';

//This Employee Objet List will
//be used to test the loadEmployeeData function in Repo
List<Employee> employeesMock = [
  Employee(
      avatar: '',
      bio: 'Mock Bio Description',
      firstName: 'John',
      id: '999',
      lastName: 'Doe',
      title: 'Jack of All Trades')
];

Employee deleteEmployeeMock = Employee(
    avatar: '',
    bio: 'Mock Bio Description',
    firstName: 'John',
    id: '999',
    lastName: 'Doe',
    title: 'Jack of All Trades');

String titleMock = 'Ingenio Page Mock Title';
