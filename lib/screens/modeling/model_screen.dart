import 'package:flutter/material.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({Key? key}) : super(key: key);

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //elevation: 0.0,
        title: const Text(
          "Heart Disease Predictor",
          style: TextStyle(color: Colors.black),
        ),
        foregroundColor: Colors.white,
      ),
      body: Form(
          child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email),
              border: InputBorder.none,
            ),
            //onChanged: {},
            validator: (value) => (value == null || !value.contains('@'))
                ? "Invalid Email!"
                : null,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email),
              border: InputBorder.none,
            ),
            //onChanged: {},
            validator: (value) => (value == null || !value.contains('@'))
                ? "Invalid Email!"
                : null,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email),
              border: InputBorder.none,
            ),
            //onChanged: {},
            validator: (value) => (value == null || !value.contains('@'))
                ? "Invalid Email!"
                : null,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email),
              border: InputBorder.none,
            ),
            //onChanged: {},
            validator: (value) => (value == null || !value.contains('@'))
                ? "Invalid Email!"
                : null,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email),
              border: InputBorder.none,
            ),
            //onChanged: {},
            validator: (value) => (value == null || !value.contains('@'))
                ? "Invalid Email!"
                : null,
          ),
        ],
      )),
    );
  }
}
