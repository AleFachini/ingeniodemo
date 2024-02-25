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
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No More Team Members'),
              );
            }
            return Expanded(
                child: ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return IngenioListItem(
                  separator: true,
                  employee: snapshot.data?[index],
                  onPressed: () => bloc.deleteEmployee(snapshot.data?[index]),
                );
              },
            ));
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
