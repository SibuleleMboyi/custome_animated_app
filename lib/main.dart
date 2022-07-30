import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/screens.dart';
import 'screens/welcome/cubit/welcome_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Animation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          color: Colors.white,
          iconTheme:  IconThemeData(color: Colors.black),
        // ignore: deprecated_member_use
        textTheme:  TextTheme( headline6: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600,),)
        ),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      debugShowCheckedModeBanner: false,
      home: BlocProvider<WelcomeCubit>(
        create: (context) => WelcomeCubit(),
        child: const WelcomeScreen(),
      ),
      //home: const SignInScreen(),
    );
  }
}
