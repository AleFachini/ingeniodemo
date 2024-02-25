import 'dart:convert';
import 'package:ingenio/data/utils/api_data_responses.dart';
import 'package:ingenio/domain/entities/ingenio_item.dart';

class IngenioRepository {
  Future<List<Employee>> loadEmployeeData() async {
    // Load the JSON string from your assets, lets add loading delay too
    String jsonString = await Future<String>.delayed(
      const Duration(milliseconds: 2000),
      () => dataJSON,
    );

    // Decode the JSON string into a List<Map<String, dynamic>>
    List<dynamic> jsonList = json.decode(jsonString);

    // Convert each map in the list to an Employee object
    return jsonList.map((e) => Employee.fromJson(e)).toList();
  }
}
