import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  /*late var _image;

  Future<void> loadAsset(String filePath) async {
    var jsonText = await rootBundle.loadString(filePath);
    _image = json.decode(jsonText);
  }*/

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CustomCard()),
    );
  }
}
