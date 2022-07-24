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
}