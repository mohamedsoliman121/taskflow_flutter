


import 'package:flutter/material.dart';



class CardWidget extends StatelessWidget{
  final Widget iconsone ;
  final String textone ;
  final Widget icontwo ;
  final String texttow;

   const CardWidget({super.key  , required this.iconsone, required this.textone, required this.icontwo, required this.texttow , });

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      Card(
              
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               
             children: [
                    Row(
                children: [
                   icontwo, 
                  Text(texttow) , 
                 
                ],
              ) , 
              Row(
                children: [
                    Text(textone) , 
                  IconButton(onPressed: () {}, icon: iconsone) , 
                
                ],
      
              ) , 
        
            
             ],
            ),),
  
            SizedBox(height: 1,)
    ],
  );
  }




}