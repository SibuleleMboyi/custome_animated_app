import 'package:custome_animated_app/screens/welcome/cubit/welcome_cubit.dart';
import 'package:custome_animated_app/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCustomAnimatedContainer extends StatefulWidget {
  const SignInCustomAnimatedContainer({Key? key}) : super(key: key);

  @override
  State<SignInCustomAnimatedContainer> createState() =>
      _SignInCustomAnimatedContainerState();
}

class _SignInCustomAnimatedContainerState
    extends State<SignInCustomAnimatedContainer> with TickerProviderStateMixin {
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
    return BlocBuilder<WelcomeCubit, WelcomeState>(builder: (context, state) {
      return Stack(
        children: [
          Center(
            child: Container(
              height: 680, //560
              width: 360, // 335
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: const LinearGradient(
                  colors: [Color.fromARGB(95, 9, 252, 21), Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 21,
            top: 88,
            child: SizedBox(
              height: 680 + 6, //560
              width: 360 + 6,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                color: Colors.white, //Colors.white60,
                shadowColor: Colors.black45,
                elevation: 4.0,
              ),
            ),
          ),
          Positioned(
            left: 21,
            top: 88,
            child: SizedBox(
              height: 680 + 6, //560
              width: 360 + 6,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                // margin: const EdgeInsets.symmetric(horizontal: 10.0),

                color: Colors.white60.withOpacity(0.3), //Colors.white60,
                shadowColor: Colors.black45,
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            Center(
                              child: Text(
                                "Welcome back!",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              "Learn smart, 2 hours of learning each",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Center(
                              child: Text(
                                "day makes a huge difference!",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const CustomForm(),
                      // const Divider(),
                      const SizedBox(height: 20.0),
                      const Text(
                        "Sign in with Email, Apple or Google",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black38,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.email,
                              size: 30.0,
                            ),
                          ),
                          //const SizedBox(width: 82.0, height: 10.0),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.apple,
                              size: 30.0,
                            ),
                          ),
                          // const SizedBox(width: 82.0, height: 10.0),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.email_outlined,
                              size: 30.0,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const Divider(),
                      const SizedBox(height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              context
                                  .read<WelcomeCubit>()
                                  .dontHaveAccount(isClicked: true);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Create Account? ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: _onTap,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Annonymous User?",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 75.0,
            left: 190.0,
            child: SizedBox(
              height: 40.0,
              width: 40.0,
              child: FloatingActionButton(
                elevation: 10.0,
                onPressed: () {
                  context
                      .read<WelcomeCubit>()
                      .isDismissedSignIn(dismissedSignIn: true);
                  context
                      .read<WelcomeCubit>()
                      .startCourseButton(isClicked: false);
                },
                backgroundColor:
                    const Color.fromARGB(255, 219, 80, 46).withOpacity(0.81),
                child: const Icon(
                  Icons.cancel,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  void _onTap() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutBack,
          );
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.centerRight,
            child: child,
          );
        },
        pageBuilder: ((context, animation, secondaryAnimation) =>
            const Scaffold()),
      ),
    );
  }
}
