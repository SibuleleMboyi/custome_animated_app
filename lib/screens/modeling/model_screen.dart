import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({Key? key}) : super(key: key);

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
          //elevation: 0.0,
          title: const Text(
            "Heart Disease Predictor",
            style: TextStyle(color: Colors.black),
          ),
          foregroundColor: Colors.white,
        ),
        //backgroundColor: Colors.white60,
        body: Form(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // _formField(fieldName: "Age", value: 37),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _formField(fieldName: "sysBP", value: 15),
                      _formField(fieldName: "diaBP", value: 15),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _formField(fieldName: "Glucose", value: 12),
                      _formField(fieldName: "Glucose", value: 20),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _formField(fieldName: "TotChol", value: 15),
                      _formField(fieldName: "Heart Rate", value: 5),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 300,
                right: 110,
                //right: 50,
                child: _formField(fieldName: "Results", value: 5),
              ),
              Positioned(
                height: 50.0,
                bottom: 20.0,
                left: 20,
                right: 20,
                child: AnimatedButton(
                  onPress: () {},
                  height: 100.0,
                  width: double.infinity,
                  text: "Start Prediction",
                  /* textStyle: const TextStyle(
                    color: Colors.black,
                  ), */
                  selectedTextColor: Colors.black45,
                  isReverse: true,
                  selectedBackgroundColor: Colors.white,
                  transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                  backgroundColor: Colors.grey,
                  borderColor: Colors.black,
                  borderWidth: 1.2,
                  borderRadius: 10,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget _formField({required String fieldName, required int value}) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: fieldName == "Results"
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(fieldName),
            const SizedBox(height: 5.0),
            Container(
              width: 150.0,
              decoration: BoxDecoration(
                color: Colors.white60,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black38, width: 1.1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    //hintText: "Email",
                    //prefixIcon: Icon(Icons.email),

                    border: InputBorder.none,
                  ),
                  //onChanged: {},
                  validator: (value) =>
                      value == null ? "Fill in all the fields" : null,
                ),
              ),
            ),
            const SizedBox(height: 13.0),
          ],
        ),
      ],
    );
  }
}
