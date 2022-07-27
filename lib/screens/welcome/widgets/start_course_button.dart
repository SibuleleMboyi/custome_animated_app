import 'package:custome_animated_app/screens/screens.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) => GestureDetector(
        onTap: _onTap,
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
                        onPressed: _onTap,
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
            ],
          ),
        ),
      );

  Future<void> _onTap() {
    _playButtonAnimation(riveAnimationController);

    return Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(seconds: 2),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOutBack,
                //curve: Curves.elasticInOut,
              );
              return ScaleTransition(
                // alignment: Alignment.bottomCenter,
                alignment: Alignment.bottomLeft,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: ((context, animation, secondaryAnimation) {
              return const SignInScreen();
            })),
      );
    });
  }

  
}
