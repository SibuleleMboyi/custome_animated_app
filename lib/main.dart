import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const OnboardScreen(),
    );
  }
}

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late RiveAnimationController riveAnimationController;

  @override
  void initState() {
    super.initState();
    riveAnimationController = OneShotAnimation("active", autoplay: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundImage(),
          _animatedBackground(),
        ],
      ),
    );
  }

  Widget _backgroundImage() => Positioned(
        bottom: 20.0,
        left: 30.0,
        child: Container(
          height: 500.0,
          width: 500.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("assets/Spline.png"),
            ),
          ),
        ),
      );

  Widget _animatedBackground() => Stack(
        children: [
          const RiveAnimation.asset(
            "rive_assets/shapes.riv",
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
            ),
          ),
        ],
      );
}
