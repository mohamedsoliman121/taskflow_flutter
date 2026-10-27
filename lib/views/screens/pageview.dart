


import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:taskflow_flutter/views/screens/welcamescreen.dart';


class Pageview extends StatelessWidget{
    const Pageview({super.key});

 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: [
     
        PageView(
       //  controller: pageController,
        children: [
       
       Pageone() ,
       Pagetow() , 
       
       
        ],
       ),
     
       Positioned(
           bottom: 40,
            left: 0,
            right: 0,
         child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
           children: List.generate(
             2,
             (index) {
               return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
               );
             },
           ),
         ),
       )
       ] 
     ),
   

    ) ;
  }




}



class Pagetow extends StatelessWidget {
  const Pagetow({super.key});

  @override
  Widget build(BuildContext context) {

   return Scaffold(
  backgroundColor: Colors.black,
    body: Center(child: Text("Page number tow")),
   ) ;
  }





}

class Pageone extends StatelessWidget {
  const Pageone({super.key});

  @override
  Widget build(BuildContext context) {

   return Scaffold(
  backgroundColor: Colors.black12,
    body: Center(child: Text("Page number one")),
   ) ;
  }
}