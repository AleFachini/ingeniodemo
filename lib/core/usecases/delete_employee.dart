import 'package:ingenio/domain/entities/ingenio_item.dart';

class DeleteEmployeeUseCase {
  List<Employee> delete(
    List<Employee> employees,
    Employee employeeToDelete,
  ) {
    employees.firstWhere((element) {
      if (element.id == employeeToDelete.id) {
        employees.remove(element);
        return true;
      } else {
        return false;
      }
    });
    return employees;
  }
}
