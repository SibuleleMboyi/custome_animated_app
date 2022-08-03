import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
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
          ),
          const SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock),
                border: InputBorder.none,
              ),
              obscureText: true,
              //onChanged: {},
              validator: (value) => (value == null || value.length < 6)
                  ? "Must be at least 6 characters"
                  : null,
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            height: 50.0,
            width: 335.0,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(30),
              ),
              //color: Color.fromARGB(255, 238, 112, 74),
              color: Color.fromARGB(255, 224, 98, 115),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
                const Text(
                  "Sign In",
                  style: TextStyle(
                    fontFamily: "Trajan Pro",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 40.0)
              ],
            ),
          ),
          const SizedBox(height: 30.0),
          Row(
            children: [
              Container(
                height: 1.0,
                width: 144.5,
                color: Colors.black12,
              ),
              const Text(
                "OR",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
              ),
              Container(
                height: 1.0,
                width: 144.5,
                color: Colors.black12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
