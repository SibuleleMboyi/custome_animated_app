import 'package:custome_animated_app/screens/welcome/cubit/welcome_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

class StartButton extends StatefulWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
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
  Widget build(BuildContext context) => BlocBuilder<WelcomeCubit, WelcomeState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => _onTap(context: context),
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
                            onPressed: () => _onTap(context: context),
                            icon: const Icon(Icons.arrow_forward),
                          ),
                          const Text(
                            "Start the journey",
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
                ],
              ),
            ),
          );
        },
      );

  void _onTap({required BuildContext context}) {
    _playButtonAnimation(riveAnimationController);

    Future.delayed(const Duration(seconds: 1), () {
      context.read<WelcomeCubit>().startCourseButton(isClicked: true);
    });
  }
}
