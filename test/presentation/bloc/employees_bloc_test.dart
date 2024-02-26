import 'package:flutter_test/flutter_test.dart';
import 'package:ingenio/core/usecases/delete_employee.dart';
import 'package:ingenio/domain/entities/ingenio_item.dart';
import 'package:ingenio/presentation/bloc/employees_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../data/ingenio_repository_test.mocks.dart';
import '../../mock/all_data_mock.dart';

void main() {
  late EmployeesBloc bloc;
  late MockIngenioRepository repo;
  late DeleteEmployeeUseCase deleteUseCase;

  setUp(() {
    deleteUseCase = DeleteEmployeeUseCase();
    repo = MockIngenioRepository();
  });

  group('WHEN Testing for use cases', () {
    test('THEN Delete Employee Use Case', () async {
      List<Employee> currentList = employeesMock;
      // Use Mockito to return a successful response
      when(repo.loadEmployeeData()).thenAnswer((_) async => currentList);

      bloc = EmployeesBloc(repo, deleteUseCase);

      //This awaits more than the delay inside the repo!
      await Future.delayed(const Duration(milliseconds: 3500), () {});

      bloc.deleteEmployee(deleteEmployeeMock);

      assert(bloc.currentList!.isEmpty);
    });
  });
}
