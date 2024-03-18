import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Employees'),
          ),
          body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('employees').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              final employees = snapshot.data!.docs;

              return ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final employee = employees[index];
                  final joinDate =
                      (employee['joinDate'] as Timestamp).toDate().toString();
                  final isActive = employee['isActive'] as bool;
                  final yearsWithOrganization = DateTime.now()
                          .difference(
                              (employee['joinDate'] as Timestamp).toDate())
                          .inDays ~/
                      365;

                  Color? tileColor;
                  if (isActive && yearsWithOrganization > 5) {
                    tileColor = const Color.fromARGB(255, 134, 236, 138);
                  }

                  return ListTile(
                    title: Text(employee['name']),
                    subtitle: Text('Joined on: $joinDate'),
                    tileColor: tileColor,
                  );
                },
              );
            },
          ),
        ));
  }
}
