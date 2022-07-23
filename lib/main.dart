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

  void _playButtonAnimation(RiveAnimationController controller) {
    if (controller.isActive == false) {
      controller.isActive = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundImage(),
          _animatedBackground(),
          _bodyContent(),
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

  Widget _startCourseButton() => GestureDetector(
        onTap: () => _playButtonAnimation(riveAnimationController),
        child: SizedBox(
          width: 200.0,
          height: 80.0,
          child: Stack(
            children: [
              RiveAnimation.asset(
                "rive_assets/button.riv",
                controllers: [riveAnimationController],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () =>
                            _playButtonAnimation(riveAnimationController),
                        icon: const Icon(Icons.arrow_forward),
                      ),
                      const Text(
                        "Start the course",
                        style: TextStyle(
                          fontFamily: "Trajan Pro",
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              // remove this to its widget

              /*  Positioned(
                right: 10.0,
                top: 25.0,
                child: Center(
                  child: Container(
                    height: 40.0,
                    width: 140.0, //180.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(60.0),
                      color: Colors.black54,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3)),
                        ),
                      ),
                    ),
                  ),
                ),
              ), */
            ],
          ),
        ),
      );

  Widget _bodyContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 130.0, 20.0, 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Learn design \n & code",
            style: TextStyle(
              fontFamily: "Poppins-Bold",
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Don't skip design. Learn design and code by building"
            "real apps with Flutter, React and Swift. Complete courses about"
            "the best tools.",
            style: TextStyle(
              fontFamily: "Inter-Regular",
              fontSize: 15.0,
            ),
          ),
          const SizedBox(height: 200.0),
          _startCourseButton(),
          const SizedBox(height: 10.0),
          const Text(
            "Purchase includes access to 30+ courses, 240+ premium Tutorials,"
            "120+ hours of videos, source files and certificates.",
            style: TextStyle(
              fontFamily: "Inter-Regular",
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
