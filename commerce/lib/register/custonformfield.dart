import 'package:commerce/app%20color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final Widget? suffixIcon;
  final bool isObscure;
  final TextInputType keyboard;
  final void Function()? suffixIconFunction;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  CustomTextFormField({
    required this.fieldName,
    required this.hintText,
    required this.suffixIcon,
    required this.isObscure,
    required this.validator,
    required this.controller,
    required this.suffixIconFunction,
    this.keyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          fieldName,
          style: Theme.of(context).textTheme.headline6!.copyWith(
            fontSize: 18,
            color: AppColor.primarycolor,
          ),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0, bottom: 20.0),
          child: TextFormField(
            controller: controller,
            obscureText: isObscure,
            keyboardType: keyboard,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText, // Here is the corrected line
              fillColor: AppColor.whitecolor,
              filled: true,
              suffixIcon: InkWell(
                onTap: suffixIconFunction,
                child: suffixIcon,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.greycolor),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primarycolor),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.redcolor),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            style: TextStyle(color: AppColor.blackcolor),
          ),
        ),
      ],
    );
  }
}
