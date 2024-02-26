import 'package:flutter_test/flutter_test.dart';
import 'package:ingenio/data/ingenio_repository.dart';
import 'package:ingenio/domain/entities/ingenio_item.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import '../mock/all_data_mock.dart';
import 'ingenio_repository_test.mocks.dart';

@GenerateMocks([IngenioRepository])
void main() {
  late MockIngenioRepository repo;

  setUp(() {
    repo = MockIngenioRepository();
  });

  group('WHEN fetching Data', () {
    test('THEN returns Employees List', () async {
      // Use Mockito to return a successful response
      when(repo.loadEmployeeData()).thenAnswer((_) async => employeesMock);

      expect(await repo.loadEmployeeData(), isA<List<Employee>>());
    });
  });
}
