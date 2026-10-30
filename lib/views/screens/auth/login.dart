

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/login_controller.dart';
import 'package:taskflow_flutter/views/widgets/textfield.dart';


class Login extends StatelessWidget {
   Login({super.key});

final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: SafeArea(
            
            child: 
          Column(
            
           // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
             Container(
             
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),),
             
              child: Icon(Icons.check, size: 50, color: Colors.white,)
              ),
              SizedBox(height: 20,),
              Text("TaskFlow", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold , color: Colors.blue),),
              SizedBox(height: 10,),
              Text("سجل دخول للمتابعة", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200 , color: Colors.grey),),
             SizedBox(height: 20,),
              Textfield(hintText: "البريد الالكتروني او رقم الهاتف", prefixIcon: Icon(Icons.email_outlined), suffixIcon: null,), 
              SizedBox(height: 10,),
               Textfield(hintText: "كلمة المرور", prefixIcon: Icon(Icons.lock_outlined), suffixIcon: Icon(Icons.visibility_off_outlined),), 
               SizedBox(height: 20,),
               ElevatedButton(onPressed: (){},
               style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
               ) , 
               child: Text('تسجيل الدخول' , 
               style : TextStyle(color: Colors.white)
               ,), 
                ),
                SizedBox(height: 10,),
                TextButton(  
                  onPressed: (){},
                  child: Text(
                  "هل نسيت كلمة المرور؟", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200 , color: Colors.blue),),
                ) , 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Divider(
                        color: Colors.grey[900],
                        thickness: 1,
                             
                      ),
                    ),
                  ),
                  Text ("أو ") , 
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(15),
                         child: Divider(
                                           color: Colors.grey[900],
                                           thickness: 1,
                                   
                                         ),
                       ),
                     ),
                  ],
                ) , 
                    Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle Google login
              },
              icon: Image.asset(
                'assets/images/google_logo.png',
                height: 24,
                width: 24,
              ),
              label: Text('continue with Google'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
            Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle Facebook login
              },
              icon: Image.asset(
                'assets/images/facebook_logo.png',
                height: 24,
                width: 24,
              ),
              label: Text('continue with Facebook'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               TextButton(  
                  onPressed: (){

        controller.gotosignup();



                  },
                  child: Text(
                  "سجل الان", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200 , color: Colors.blue),),
                ) ,
            Text("ليس لديك حساب؟", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200 , color: Colors.grey),),
           
          ],)
        ],
             ) ,
            ],
          ) , 
         
          
          ),
        ),
      ),
    );

  }



}