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

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 8)); //15
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    );

    _animationController.forward();
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
            _bodyContent(),
            state.startCourseButton == true
                ? _signInAnimatedContainer()
                : const SizedBox.shrink(),
            state.dontHaveAccount == true
                ? _signUpAnimatedContainer()
                : const SizedBox.shrink(),
          ],
        );
      }),
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
            "Care \nFor your \nHealth",
            style: TextStyle(
              fontFamily: "Poppins-Bold",
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "WHO statistics reavel that Heart Disease is the leading killer monster in the world. "
            "And we believe that disasters don't just happen, they are triggered by a series of events. "
            "This platform helps you mitigate those series of events to avoid being aware when its too late "
            "by checking how at risk are you in getting this disease. "
            "Prevention is better than cure.",
            style: TextStyle(
              fontFamily: "Inter-Regular",
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: 150.0),
          StartButton(),
          SizedBox(height: 10.0),
          Text(
            "Website for this service is currently not available, "
            "and we will keep you updated once we have it built and ready to use.",
            style: TextStyle(
              fontFamily: "Inter-Regular",
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _signInAnimatedContainer() {
    
    return ScaleTransition(
      scale: _animation,
      alignment: Alignment.bottomLeft,
      child: const Center(child: SignInCustomAnimatedContainer()),
    );
  }

  Widget _signUpAnimatedContainer() {
    return ScaleTransition(
      scale: _animation,
      alignment: Alignment.bottomLeft,
      child: const Center(child: SignUpCustomAnimatedContainer()),
    );
  }
}
