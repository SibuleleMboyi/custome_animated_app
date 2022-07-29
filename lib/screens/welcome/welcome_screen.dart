import 'package:custome_animated_app/screens/sign-in/widgets/widgets.dart';
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

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          const AnimatedBackground(),
          _bodyContent(),
          BlocBuilder<WelcomeCubit, WelcomeState>(
            builder: (context, state) {
              return SizedBox(
                // child: context.read<WelcomeCubit>().startCourseButton(isClicked: isClicked),
                child: state.startCourseButton == true
                    ? _animatedContainer()
                    : const SizedBox.shrink(),
              );
            },
          ),
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
            "Don't skip design. Learn design and code by building "
            "real apps with Flutter, React and Swift. Complete courses about "
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
            "Purchase includes access to 30+ courses, 240+ premium Tutorials, "
            "120+ hours of videos, source files and certificates. ",
            style: TextStyle(
              fontFamily: "Inter-Regular",
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _animatedContainer() {
    Future.delayed(const Duration(seconds: 10), () {});

    /*return AnimatedContainer(
      height: 450.0,
      width: 300.0,
      color: Colors.greenAccent,
      curve: Curves.easeInOutBack,
      duration: const Duration(seconds: 5),
    );*/

    return ScaleTransition(
      scale: _animation,
      alignment: Alignment.bottomLeft,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: ((context, child) => const Center(child: CustomCard())),
      ),
    );
  }
}
