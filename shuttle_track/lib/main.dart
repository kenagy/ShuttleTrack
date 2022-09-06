import 'package:flutter/material.dart';
import 'package:shuttle_track/screens/login.dart';
import 'package:shuttle_track/utils/appStyles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Styles.bgColor,
        bottomAppBarColor: Styles.bgColor,
        primarySwatch: Colors.blue,
      ),

      home: const LoginPage(),
    );
  }
}

