
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/forget_controller.dart';
import 'package:taskflow_flutter/views/widgets/textfield.dart';

class ForgetpasswordScreen extends StatelessWidget {
   ForgetpasswordScreen({super.key});
final controller = Get.find<Forgetpasswordcontroller>();

  @override
  Widget build(BuildContext context) {

   return Scaffold(
    appBar: AppBar(
        title: Text('Forget Password'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(

  child : GetBuilder<Forgetpasswordcontroller>(
    builder: (controller) => Column(
          children: [


            SizedBox(height: 150),
            Textfield(
              
              
              hintText:  "Forget Password"
            
             
            
            , prefixIcon: Icon(Icons.email), 
            suffixIcon: null, 
            controller: controller.emailcontroller,
             validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال البريد الالكتروني';
              }
              return null;
            },
            ),
            ElevatedButton(
           style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            backgroundColor: controller.isButtonEnabled ? Colors.blue : Colors.grey, // Change color based on button state
                 


           ),
               onPressed: () {
 controller.isButtonEnabled ? controller.resetPassword() : null; // Call resetPassword only if button is enabled        

 // Call the timeupdate method when the button is pressed

               } , 
          

            

              child: Text('Reset Password'),  
            ) , 

 if(controller.isButtonEnabled == false)
 Text(
                  'Time remaining: ${controller.x} seconds',
                  style: TextStyle(fontSize: 16),
                ) , 
              
            
          ],
        ), 
  ) 






        
      ),
    );  
  }




}
  