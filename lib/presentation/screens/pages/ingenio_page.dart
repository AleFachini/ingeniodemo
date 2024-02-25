import 'package:flutter/material.dart';
import 'package:ingenio/core/usecases/delete_employee.dart';
import 'package:ingenio/data/ingenio_repository.dart';
import 'package:ingenio/presentation/bloc/employees_bloc.dart';
import 'package:ingenio/presentation/screens/views/ingenio_list_view.dart';

class IngenioPage extends StatelessWidget {
  late final String title;
  IngenioPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ingenioRepository = IngenioRepository();
    final deleteEmployeeUseCase = DeleteEmployeeUseCase();
    final employeesBloc =
        EmployeesBloc(ingenioRepository, deleteEmployeeUseCase);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).primaryTextTheme.headlineMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: IngenioListView(bloc: employeesBloc),
    );
  }
}
