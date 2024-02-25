import 'dart:async';

import 'package:ingenio/core/usecases/delete_employee.dart';
import 'package:ingenio/data/ingenio_repository.dart';
import 'package:ingenio/domain/entities/ingenio_item.dart';

class EmployeesBloc {
  final IngenioRepository ingenioRepository;
  final DeleteEmployeeUseCase deleteEmployeeUseCase;
  late final List<Employee> _employeesList;
  List<Employee>? _currentList;

  final _employeesStreamController =
      StreamController<List<Employee>>.broadcast();
  Stream<List<Employee>> get employeesListStream =>
      _employeesStreamController.stream;

  EmployeesBloc(this.ingenioRepository, this.deleteEmployeeUseCase) {
    _initialize();
  }

  void _initialize() async {
    _employeesList = await ingenioRepository.loadEmployeeData();
    _employeesStreamController.add(_employeesList);
    _currentList = _employeesList;
  }

  void deleteEmployee(Employee? deleteEmployee) async {
    final newList = deleteEmployee != null
        ? deleteEmployeeUseCase.delete(_currentList!, deleteEmployee)
        : _currentList;
    _currentList = newList;
    _employeesStreamController.add(newList!);
  }

  void dispose() {
    _employeesStreamController.close();
  }
}
