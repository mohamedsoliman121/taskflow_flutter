
import 'package:flutter/material.dart';



class Textfield extends StatelessWidget {
  final String hintText;
  final Widget ? prefixIcon;
  final Widget ? suffixIcon;

  const Textfield({super.key , required this.hintText ,  required this.prefixIcon ,required this.suffixIcon});
 
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextFormField(
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