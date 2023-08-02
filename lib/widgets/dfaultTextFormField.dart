import 'package:elearning/widgets/defaultText.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class DefaultFormField extends StatelessWidget {
  late final String tittle;
  late final double width;
  late double height;
  late final TextEditingController controller;
  late final TextInputType type;
  final String? Function(String?)? validate;
  final String? hintText;
  bool? obSecure;
  IconData? prefix;
  IconData? suffix;
  void Function()? suffixButtonPressed;
  bool isPassword;
  late final Color borderColor;
  late final Color cursorColor;
  late final Color textColor;

  DefaultFormField({super.key,
    required this.tittle,
    required this.width,
    required this.height,
    required this.controller,
    required this.type,
    required this.validate,
    this.hintText,
    this.isPassword = false,
    this.suffixButtonPressed,
    this.obSecure,
    this.prefix,
    this.suffix,
    this.borderColor = Colors.white,
    this.textColor =Colors.black,
    this.cursorColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(text: tittle,fontWeight: FontWeight.bold,),
        const SizedBox(height: 10,),
        SizedBox(
          width: width,
          height: height,
          child: TextFormField(
            style: TextStyle(
              color: textColor,
            ),
            cursorColor: cursorColor,
            keyboardType: type,
            controller: controller,
            obscureText: obSecure ?? false,
            validator: validate,
            decoration: InputDecoration(
              filled: true,
              contentPadding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              suffixIcon: isPassword == true
                  ? InkWell(
                      onTap: suffixButtonPressed,
                      child: Icon(
                        suffix,
                        size: 20,
                        color: AppColors.purple,
                      ),
                    )
                  : null,
              // prefix: prefix != null ? Icon(prefix) : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: borderColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              )
            ),
          ),
        ),
      ],
    );
  }
}
