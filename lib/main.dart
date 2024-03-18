import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zylu/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:669944264452:android:d3c2046a9e43a095cac251',
      messagingSenderId: '669944264452',
      apiKey: 'AIzaSyDpHYGzLMsnjgjdQT2SRO379cYeXVrXkt4',
      projectId: 'zylu-ef630',
    ),
  );
  runApp(const EmployeesPage());
}
