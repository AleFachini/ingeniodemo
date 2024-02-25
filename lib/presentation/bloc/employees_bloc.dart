import 'dart:async';

import 'package:ingenio/core/usecases/delete_employee.dart';
import 'package:ingenio/data/ingenio_repository.dart';
import 'package:ingenio/domain/entities/ingenio_item.dart';

class EmployeesBloc {
  final IngenioRepository ingenioRepository;
  final DeleteEmployeeUseCase deleteEmployeeUseCase;
  late final List<Employee> _employeesList;

  final _employeesStreamController = StreamController<List<Employee>>();
  Stream<List<Employee>> get employeesListStream =>
      _employeesStreamController.stream;

  EmployeesBloc(this.ingenioRepository, this.deleteEmployeeUseCase) {
    _initialize();
  }

  void _initialize() async {
    _employeesList = await ingenioRepository.loadEmployeeData();
    _employeesStreamController.add(_employeesList);
  }

  void deleteEmployee(Employee deleteEmployee) async {
    final currentList = await _employeesStreamController.stream.first;
    final newList = deleteEmployeeUseCase.delete(currentList, deleteEmployee);
    _employeesStreamController.add(newList);
  }

  void dispose() {
    _employeesStreamController.close();
  }
}
