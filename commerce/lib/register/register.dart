import 'package:flutter/material.dart';

class RegistersCreen extends StatefulWidget {
  const RegistersCreen({super.key});

  @override
  State<RegistersCreen> createState() => _RegistersCreenState();
}

class _RegistersCreenState extends State<RegistersCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 91.0,bottom: 46.0 ,left: 97.0 ,right:97.0)
              ),
Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(padding:
      EdgeInsets.only(
        top: 1.0),
  child: Form(
  key: formkey,
    child: Column(
      children: [
        TextFieditem(
          f
        )
      ],
    ),
      ))
    ],
  ),
    )
            ],
          ),
        ),
      ),
    );
  }
}
