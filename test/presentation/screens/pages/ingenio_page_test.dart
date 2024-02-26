import 'package:flutter_test/flutter_test.dart';
import 'package:ingenio/core/service_locator.dart';
import 'package:ingenio/core/usecases/delete_employee.dart';
import 'package:ingenio/data/ingenio_repository.dart';
import 'package:ingenio/presentation/bloc/employees_bloc.dart';
import 'package:ingenio/presentation/screens/pages/ingenio_page.dart';

import '../../../mock/all_data_mock.dart';

void main() {
  final repo = IngenioRepository();
  final deleteCase = DeleteEmployeeUseCase();

  setUpAll(() {
    serviceLocator.registerSingleton(EmployeesBloc(repo, deleteCase));
  });

  group('WHEN creating main page', () {
    testWidgets('Then Ingenio Page is presented', (tester) async {
      await tester.pumpWidget(IngenioPage(
        title: titleMock,
      ));

      // Create the Finders.
      final titleFinder = find.text(titleMock);

      expect(titleFinder, findsOneWidget);
    });
  });
}
