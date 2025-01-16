import 'package:api_dio/data/api/employee_api.dart';
import 'package:api_dio/data/models/employee_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Create a flag to track data loading state
  bool isLoading = true;
  // Init an empty list of EmployeeModel to store the data
  List<EmployeeModel> users = [];

  @override
  void initState() {
    super.initState();
    getEmpoyees();
  }

  // Get the list of employees from the server
  // and set data loading state to false
  void getEmpoyees() async {
    users = await EmployeeApi().getEmployees();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: isLoading ? Center(child: CircularProgressIndicator()) : _body(),
    );
  }

  // Build the AppBar
  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Text('Employees'),
      backgroundColor: Colors.lightBlueAccent,
    );
  }

  // Build the listview that displays the data
  Widget _body() {
    return users.isEmpty
        ? Text('No data found!')
        : ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => ListTile(
              leading: Text('${users[index].id}'),
              title: Text(users[index].name),
              subtitle: Text(users[index].email),
              trailing: const Icon(Icons.person_rounded),
            ),
          );
  }
}
