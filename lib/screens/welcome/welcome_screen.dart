import 'dart:ui';

import 'package:custome_animated_app/screens/sign-in/widgets/widgets.dart';
import 'package:custome_animated_app/screens/sign-up/widgets/widgets.dart';
import 'package:custome_animated_app/screens/welcome/cubit/welcome_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late bool animateBodyContent = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animation.isDismissed;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<WelcomeCubit, WelcomeState>(builder: (context, state) {
        return Stack(
          children: [
            const BackgroundImage(),
            const AnimatedBackground(),
            state.startCourseButton
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.4)),
                    ),
                  )
                : const SizedBox.shrink(),
            AnimatedAlign(
              alignment: !state.startCourseButton
                  ? Alignment.bottomCenter
                  : Alignment.topCenter,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: animatedContainer(),
            ),
            state.startCourseButton &&
                    !state.dontHaveAccount &&
                    !state.dismissedSignUp &&
                    !state.dismissedSignUp
                ? _signInAnimatedContainer()
                : state.dontHaveAccount &&
                        state.startCourseButton &&
                        !state.dismissedSignUp
                    ? _signUpAnimatedContainer()
                    : state.dismissedSignUp && !state.dismissedSignIn
                        ? _signUpAnimatedContainerDismissal()
                        : state.dismissedSignIn
                            ? _signInAnimatedContainerDismissal()
                            : const SizedBox.shrink(),
          ],
        );
      }),
    );
  }

  Widget animatedContainer() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 10.0),
      child: Container(
        color: Colors.white.withOpacity(0.0),
        height: 700,
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Learn \nDesign \n& Code",
              style: TextStyle(
                fontFamily: "Poppins-Bold",
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Don't skip design. Learn design and code by "
              "building real apps with Flutter, React and Swift. "
              "Complete courses about the best tools. ",
              style: TextStyle(
                fontFamily: "Inter-Regular",
                fontSize: 15.0,
              ),
            ),
            SizedBox(height: 150.0),
            StartButton(),
            SizedBox(height: 10.0),
            Text(
              "Purchase includes access to 30+ courses, 240+ "
              "premium tutorials, 120+ hours of videos, source codes and certificates.",
              style: TextStyle(
                fontFamily: "Inter-Regular",
                fontSize: 13.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 130.0, 20.0, 10.0),
      child: Container(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Learn \nDesign \n& Code",
              style: TextStyle(
                fontFamily: "Poppins-Bold",
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Don't skip design. Learn design and code by "
              "building real apps with Flutter, React and Swift. "
              "Complete courses about the best tools. ",
              style: TextStyle(
                fontFamily: "Inter-Regular",
                fontSize: 15.0,
              ),
            ),
            SizedBox(height: 150.0),
            StartButton(),
            SizedBox(height: 10.0),
            Text(
              "Purchase includes access to 30+ courses, 240+ "
              "premium tutorials, 120+ hours of videos, source codes and certificates.",
              style: TextStyle(
                fontFamily: "Inter-Regular",
                fontSize: 13.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInAnimatedContainer() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    ); //2

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    );

    _animationController.forward();

    return ScaleTransition(
      scale: _animation,
      alignment: Alignment.bottomCenter,
      child: const Center(child: SignInCustomAnimatedContainer()),
    );
  }

  Widget _signInAnimatedContainerDismissal() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    ); //2

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    );

    _animationController.reverse(from: 1.0);

    return ScaleTransition(
      scale: _animation,
      alignment: Alignment.bottomCenter,
      child: const Center(child: SignInCustomAnimatedContainer()),
    );
  }

  Widget _signUpAnimatedContainerDismissal() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..reverse(from: 1.0);

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    );

    return ScaleTransition(
      scale: _animation,
      alignment: Alignment.centerLeft,
      child: const Center(child: SignUpCustomAnimatedContainer()),
    );
  }

  Widget _signUpAnimatedContainer() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    ); //2

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    );

    _animationController.forward();

    return ScaleTransition(
      scale: _animation,
      alignment: Alignment.centerLeft,
      child: const Center(child: SignUpCustomAnimatedContainer()),
    );
  }
}
