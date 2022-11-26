import 'package:custome_animated_app/screens/welcome/cubit/welcome_cubit.dart';
import 'package:custome_animated_app/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCustomAnimatedContainer extends StatefulWidget {
  const SignUpCustomAnimatedContainer({Key? key}) : super(key: key);

  @override
  State<SignUpCustomAnimatedContainer> createState() =>
      _SignUpCustomAnimatedContainerState();
}

class _SignUpCustomAnimatedContainerState
    extends State<SignUpCustomAnimatedContainer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeCubit, WelcomeState>(
      builder: (context, state) {
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
                          "Sign Up",
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
                                  "Join thousands of other",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Text(
                                "students like you.",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Pave your way to your bright future.",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const CustomForm(),
                        // const Divider(),
                        const SizedBox(height: 20.0),
                        const Text(
                          "Sign up with Apple or Google",
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 72.0,
              left: 183.0,
              child: IconButton(
                color: Colors.black87,
                onPressed: () {
                  context.read<WelcomeCubit>().isDismissed(dismissed: true);
                  context
                      .read<WelcomeCubit>()
                      .startCourseButton(isClicked: false);
                  context
                      .read<WelcomeCubit>()
                      .dontHaveAccount(isClicked: false);
                },
                icon: const Icon(
                  Icons.cancel,
                  size: 30.0,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
