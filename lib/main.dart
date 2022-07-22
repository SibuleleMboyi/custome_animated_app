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
          _startCourseButton(),
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

  Widget _startCourseButton() => Center(
        child: GestureDetector(
          onTap: () => _playButtonAnimation(riveAnimationController),
          child: SizedBox(
            //color: Colors.red,
            width: 200.0,
            height: 100.0,
            child: Stack(
              children: [
                Positioned(
                  right: 0.0,
                  top: 25.0,
                  child: Center(
                    child: Container(
                      height: 52.0,
                      width: 180.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.0,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      //height: 20.0,
                      width: 250.0,
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.3)),
                    ),
                  ),
                ),
                RiveAnimation.asset(
                  "rive_assets/button.riv",
                  controllers: [riveAnimationController],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () =>
                              _playButtonAnimation(riveAnimationController),
                          icon: const Icon(Icons.arrow_forward),
                        ),
                        const Text(
                          "Start the course",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(172, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
