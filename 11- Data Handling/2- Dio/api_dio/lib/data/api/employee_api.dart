import 'package:api_dio/data/models/employee_model.dart';
import 'package:dio/dio.dart';

class EmployeeApi {
  // Store the URL in a static variable
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  late Dio dio;

  EmployeeApi() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
  }

  // Connect the server and get the json data
  Future<List<EmployeeModel>> getEmployees() async {
    try {
      // Catch the response from the server
      var response = await dio.get('/users');
      // Check if response code is OK
      if (response.statusCode == 200) {
        // Iterate over each element in the json list and return an iterable of
        // EmployeeModel instances, then converte them to a list.
        return (response.data as List)
            .map((e) => EmployeeModel.fromJson(e))
            .toList();
      }
      // if response code is not OK, Throw this msg
      throw 'Request failed with status: ${response.statusCode}.';
    } on Exception catch (e) {
      // If an error happens, throw it
      throw e.toString();
    }
  }
}
