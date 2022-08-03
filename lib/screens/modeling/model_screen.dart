import 'package:custome_animated_app/screens/modeling/cubit/modeling_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: BlocConsumer<ModelingCubit, ModelingState>(
            listener: (context, state) {
          if (state.status == ModelingStatus.requesting) {
            const CircularProgressIndicator(
              color: Colors.grey,
            );
          } else if (state.status == ModelingStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.redAccent,
              duration: const Duration(seconds: 3),
            ));
          }
        }, builder: (context, state) {
          return Form(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // _formField(fieldName: "Age", value: 37),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text("age"),
                              const SizedBox(height: 5.0),
                              Container(
                                width: 150.0,
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: Colors.black38, width: 1.1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: TextFormField(
                                    onChanged: (value) => context
                                        .read<ModelingCubit>()
                                        .setAge(age: int.parse(value)),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      //hintText: "Email",
                                      //prefixIcon: Icon(Icons.email),

                                      border: InputBorder.none,
                                    ),
                                    //onChanged: {},
                                    validator: (value) => value == null
                                        ? "Fill in all the fields"
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text("sysBP"),
                              const SizedBox(height: 5.0),
                              Container(
                                width: 150.0,
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: Colors.black38, width: 1.1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: TextFormField(
                                    onChanged: (value) => context
                                        .read<ModelingCubit>()
                                        .setSysBP(sysBP: int.parse(value)),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      //hintText: "Email",
                                      //prefixIcon: Icon(Icons.email),

                                      border: InputBorder.none,
                                    ),
                                    //onChanged: {},
                                    validator: (value) => value == null
                                        ? "Fill in all the fields"
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text("diaBP"),
                              const SizedBox(height: 5.0),
                              Container(
                                width: 150.0,
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: Colors.black38, width: 1.1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: TextFormField(
                                    onChanged: (value) => context
                                        .read<ModelingCubit>()
                                        .setDiaBP(diaBP: int.parse(value)),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      //hintText: "Email",
                                      //prefixIcon: Icon(Icons.email),

                                      border: InputBorder.none,
                                    ),
                                    //onChanged: {},
                                    validator: (value) => value == null
                                        ? "Fill in all the fields"
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text("BMI"),
                              const SizedBox(height: 5.0),
                              Container(
                                width: 150.0,
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: Colors.black38, width: 1.1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: TextFormField(
                                    onChanged: (value) => context
                                        .read<ModelingCubit>()
                                        .setBMI(bmi: int.parse(value)),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      //hintText: "Email",
                                      //prefixIcon: Icon(Icons.email),

                                      border: InputBorder.none,
                                    ),
                                    //onChanged: {},
                                    validator: (value) => value == null
                                        ? "Fill in all the fields"
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text("glucose"),
                              const SizedBox(height: 5.0),
                              Container(
                                width: 150.0,
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: Colors.black38, width: 1.1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: TextFormField(
                                    onChanged: (value) => context
                                        .read<ModelingCubit>()
                                        .setGlucose(glucose: int.parse(value)),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      //hintText: "Email",
                                      //prefixIcon: Icon(Icons.email),

                                      border: InputBorder.none,
                                    ),
                                    //onChanged: {},
                                    validator: (value) => value == null
                                        ? "Fill in all the fields"
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text("totChol"),
                              const SizedBox(height: 5.0),
                              Container(
                                width: 150.0,
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: Colors.black38, width: 1.1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: TextFormField(
                                    onChanged: (value) => context
                                        .read<ModelingCubit>()
                                        .setTotChol(totChol: int.parse(value)),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      //hintText: "Email",
                                      //prefixIcon: Icon(Icons.email),

                                      border: InputBorder.none,
                                    ),
                                    //onChanged: {},
                                    validator: (value) => value == null
                                        ? "Fill in all the fields"
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text("heartRate"),
                              const SizedBox(height: 5.0),
                              Container(
                                width: 150.0,
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: Colors.black38, width: 1.1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: TextFormField(
                                    onChanged: (value) => context
                                        .read<ModelingCubit>()
                                        .setHeartRate(
                                            heartRate: int.parse(value)),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      //hintText: "Email",
                                      //prefixIcon: Icon(Icons.email),

                                      border: InputBorder.none,
                                    ),
                                    //onChanged: {},
                                    validator: (value) => value == null
                                        ? "Fill in all the fields"
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 300,
                    right: 110,

                    //right: 50,
                    child: Column(
                      children: [
                        const Text("Results"),
                        const SizedBox(height: 5.0),
                        Container(
                          width: 150.0,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(color: Colors.black38, width: 1.1),
                          ),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Center(
                                  child: Text(
                                state.results.toString(),
                              ))),
                        ),
                        Text(state.message),
                      ],
                    ),
                  ),
                  Positioned(
                    height: 50.0,
                    bottom: 20.0,
                    left: 20,
                    right: 20,
                    child: AnimatedButton(
                      onPress: () {
                        context.read<ModelingCubit>().getPredictions();
                      },
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
            ),
          );
        }),
      ),
    );
  }
}
