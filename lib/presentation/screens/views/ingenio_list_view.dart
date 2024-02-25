import 'package:flutter/material.dart';
import 'package:ingenio/domain/entities/ingenio_item.dart';
import 'package:ingenio/presentation/bloc/employees_bloc.dart';
import 'package:ingenio/presentation/widgets/ingenio_list_item_widget.dart';

class IngenioListView extends StatelessWidget {
  final EmployeesBloc bloc;

  const IngenioListView({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<List<Employee>>(
        stream: bloc.employeesListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const IngenioListItem(),
                Text(
                  'Employees: ${snapshot.data?.length}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Delete'),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
