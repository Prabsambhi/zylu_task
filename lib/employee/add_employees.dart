// In this file, I've written the code to add all the employees to cloud Firestore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zylu/employee/employee_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> addData() async {
    for (var employee in employeesData) {
      await FirebaseFirestore.instance.collection('employees').add(employee);
    }
    // print("Employees added");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: OutlinedButton(
            onPressed: () {
              addData();
            },
            child: const Text('Button')),
      ),
    ));
  }
}
