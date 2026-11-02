
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/signup_controller.dart';
import 'package:taskflow_flutter/views/widgets/textfield.dart';


class Signup extends StatelessWidget {
   Signup({super.key});

  final controller = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body : SizedBox(
      width: double.infinity,
       child: GetBuilder<SignupController>(
         builder: (controller) =>  Form(
          key: controller.formKey,
           child: Column(
             children: [
              SizedBox(height: 150,),
               Text("إنشاء حساب جديد", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold , color: Colors.black),),
               SizedBox(height: 20,),
               Textfield(
                controller: controller.nameController,
                hintText: "الاسم الاول",
                 prefixIcon: null,
                 suffixIcon: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الاسم الاول';
                    }
                    return null;
                  },
               ) , 
                   SizedBox(height: 20,),
               Textfield(
                controller: controller.emailController,
                hintText: "البريد الالكتروني",
                 prefixIcon: null,
                 suffixIcon: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال البريد الالكتروني';
                    }
                    return null;
                  },
               ) , 
               
                   SizedBox(height: 20,),
                        Textfield(
                          controller: controller.passwordController,
                hintText: "كلمة المرور",
                 prefixIcon: null,
                 obscureText: !controller.visibility,
                 suffixIcon: IconButton(onPressed: () {
                 controller.changevisibility();

                 }, icon: Icon(controller.visibility ? Icons.visibility : Icons.visibility_off)) ,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال كلمة المرور';
                    }
                    return null;
                  },
               ) ,
               
                   SizedBox(height: 20,),
                        Textfield(
                          controller: controller.confirmPasswordController,
                hintText: "تأكيد كلمة المرور",
                 prefixIcon: null,
                  obscureText: !controller.visibility,
                 suffixIcon: Icon(Icons.lock_outline) ,
                  validator:  (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء تأكيد كلمة المرور';
                    }
                    if (value != controller.passwordController.text) {
                      return 'كلمة المرور غير متطابقة';
                    }
                    return null;
                  },
               ) ,
               SizedBox(height: 20,),
               ElevatedButton(
                onPressed: () {
                  
                  controller.signUp();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set the background color to blue
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500 , color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set the border radius to 10
                  )
                ),
                child: Text("إنشاء حساب" , style: TextStyle(color: Colors.white),),
               ) , 
               SizedBox(height: 20,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
           GestureDetector(
                  onTap: () {
                    controller.gotologin();
                  },
                  child: Text("تسجيل الدخول" , style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500 , color: Colors.blue),),
                ) , 
           
           
             
                SizedBox(width: 10,),
                   Text("هل لديك حساب بالفعل؟" , style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500 , color: Colors.black),),
               ],)
             ] , 
           ),
         ),
       ),
     ) ,
    );
  }
}