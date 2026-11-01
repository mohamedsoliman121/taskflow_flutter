
import 'package:flutter/material.dart';



class Textfield extends StatelessWidget {
  final String hintText;
  final Widget ? prefixIcon;
  final Widget ? suffixIcon;
  final TextEditingController ? controller;
 final String? Function(String?)? validator;
 final bool obscureText; // 1. أضف هذه

  const Textfield({super.key , required this.hintText ,  required this.prefixIcon ,required this.suffixIcon,required this.controller ,required this.validator,  this.obscureText = false,}); // 2. أضف هذه
 
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextFormField(
        controller: controller,
  validator: validator,
        obscureText: obscureText,
        onChanged: (value) {
          // Handle text input changes
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          
          
          ),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }





}