import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          const AnimatedBackground(),
          _bodyContent(),
        ],
      ),
    );
  }

  Widget _bodyContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 130.0, 20.0, 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Learn \ndesign \n& code",
            style: TextStyle(
              fontFamily: "Poppins-Bold",
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Don't skip design. Learn design and code by building"
            "real apps with Flutter, React and Swift. Complete courses about"
            "the best tools.",
            style: TextStyle(
              fontFamily: "Inter-Regular",
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: 200.0),
          StartButton(),
          SizedBox(height: 10.0),
          Text(
            "Purchase includes access to 30+ courses, 240+ premium Tutorials,"
            "120+ hours of videos, source files and certificates.",
            style: TextStyle(
              fontFamily: "Inter-Regular",
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }
}
