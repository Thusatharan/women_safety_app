import 'package:flutter/material.dart';
import 'package:women_safety_app/Screens/Admin/admin_dashboad_screen.dart';
import 'package:women_safety_app/Screens/Admin/admin_screen.dart';
import 'package:women_safety_app/Screens/Admin/case_details.dart';
import 'package:women_safety_app/Screens/Auth/login_screen.dart';
import 'package:women_safety_app/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color.fromRGBO(255, 97, 112, 1.0),

          visualDensity: VisualDensity.adaptivePlatformDensity,
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
        ),
        initialRoute: '/5',
        routes: {
          '/1': (context) => const AdminScreen(),
          '/2': (context) => AdminDashboardScreen(),
          '/4': (context) => const HomeScreen(),
          '/5': (context) => LoginScreen(),
        });
  }
}
