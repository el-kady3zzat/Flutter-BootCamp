import 'package:api_http/data/models/employee_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class EmployeeApi {
  // Store the URL in a static variable
  static String baseUrl = 'https://jsonplaceholder.typicode.com/users';

  // Connect the server and get the json data
  Future<List<EmployeeModel>> getEmployees() async {
    try {
      // Catch the response from the server
      var response = await http.get(Uri.parse(baseUrl));
      // Check if response code is OK
      if (response.statusCode == 200) {
        // Parse the JSON-encoded string into a Dart object
        // and cast the resulting object to a List
        var json = convert.jsonDecode(response.body) as List;
        // Iterate over each element in the json list and return an iterable of
        // EmployeeModel instances, then converte them to a list.
        return json.map((e) => EmployeeModel.fromJson(e)).toList();
      }
      // if response code is not OK, Throw this
      throw 'Request failed with status: ${response.statusCode}.';
    } on Exception catch (e) {
      // If an error happens, throw it
      throw e.toString();
    }
  }
}
