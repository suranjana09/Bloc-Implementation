import 'package:ecom_app/bloc/login/login_bloc.dart';
import 'package:ecom_app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
        return BlocProvider(
          create: (BuildContext context) => LoginBloc(),
          child: const LoginScreen(),
        );
      }));
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
