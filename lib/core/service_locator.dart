import 'package:get_it/get_it.dart';
import 'package:ingenio/core/usecases/delete_employee.dart';
import 'package:ingenio/data/ingenio_repository.dart';
import 'package:ingenio/presentation/bloc/employees_bloc.dart';

final serviceLocator = GetIt.instance;

void setupLocator() {
  // Register your Repository
  serviceLocator
      .registerLazySingleton<IngenioRepository>(() => IngenioRepository());

  //Register UseCases for BLoC, this could not be used here
  serviceLocator.registerLazySingleton<DeleteEmployeeUseCase>(
      () => DeleteEmployeeUseCase());

  // Register your BLoC
  serviceLocator.registerFactory<EmployeesBloc>(() => EmployeesBloc(
        serviceLocator<IngenioRepository>(),
        serviceLocator<DeleteEmployeeUseCase>(),
      ));
}
