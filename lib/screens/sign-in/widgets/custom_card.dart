import 'package:custome_animated_app/screens/sign-in/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  OverlayEntry? entry;
  final layerLink = LayerLink();
  final shiftCardUpAndLeft = 4.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _showOverlay();
    });
  }

  void _showOverlay() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    //final offset = renderBox.localToGlobal(Offset.zero);

    var logger = Logger();
    logger.d("Overlay Logger Width :::: ${size.width}");
    logger.d("Overlay Logger Height :::: ${size.height}");

    final overlay = Overlay.of(context)!;
    entry = OverlayEntry(
      builder: (context) => Positioned(
        //left: offset.dx,
        //top: offset.dy,
        width: size.width - shiftCardUpAndLeft,
        height: size.height - shiftCardUpAndLeft,
        child: CompositedTransformFollower(
            link: layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0, 0),
            child: _buildOverlay()),
      ),
    );

    overlay.insert(entry!);
  }

  Widget _buildOverlay() {
    return Material(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          // margin: const EdgeInsets.symmetric(horizontal: 10.0),
          color: Colors.white60,
          shadowColor: Colors.black45,
          elevation: 4.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Access up to 240+ hours of content. "
                    "Learn design and code by building "
                    "real apps with Flutter, React and Swift.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 20.0),
                const CustomForm(),
                // const Divider(),
                const SizedBox(height: 20.0),
                const Text(
                  "Sign un with Email, Apple or Google",
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
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CompositedTransformTarget(
          link: layerLink,
          child: Container(
            height: 680, //560
            width: 360, // 335
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: const LinearGradient(
                  colors: [Color.fromARGB(95, 9, 252, 21), Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
          ),
        ),
      ],
    );
  }
}
