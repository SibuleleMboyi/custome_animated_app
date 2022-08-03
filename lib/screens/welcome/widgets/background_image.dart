import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
       => Positioned(
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
  
}