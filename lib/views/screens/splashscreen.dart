
import 'package:flutter/material.dart';
import 'package:taskflow_flutter/utils/themecolors.dart';


class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});



  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
     backgroundColor: primaryLight,

     body: Container(
      width: double.infinity,

      decoration: BoxDecoration(
      gradient: LinearGradient(
     begin: Alignment.centerLeft , 
     end: Alignment.centerRight , 

colors: [
      Color(0xFF1746A2), // الشمال: أزرق داكن
      Color(0xFF246BFD), // اليمين: أزرق فاتح

]

      ), 
      ),
       child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: white , 
              borderRadius: BorderRadius.circular(10) , 
     boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.15), // لون ظل خفيف لإبراز الأيقونة
        blurRadius: 16, // انتشار الظل
        offset: Offset(0, 8), // مكان الظل لتحت شوية
      ),
    ],

            ),
            child: 
            
            ShaderMask(
  shaderCallback: (bounds) => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF2563EB), // درجة أزرق فاتح
      Color(0xFF1D4ED8), // درجة أزرق غامق
    ],
  ).createShader(bounds),
  child:Icon(Icons.task_alt_rounded , color: Color(0xFF246BFD), size: 50,),
)
            
            // Icon(Icons.task_alt_rounded , color: Color(0xFF246BFD), size: 50,),
          ) , 
          SizedBox(height: 20,) , 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("TASK"  , 
              style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 30),)  ,
              Text("FLOW" , style: TextStyle(fontWeight: FontWeight.bold , color: accentCyan, fontSize: 30),)
            ],
          ) , 
   SizedBox(height: 20,) , 
   
     
                Text("خطط . نظم  . أنجز"  , 
                style: TextStyle(  color: white , fontSize: 20),)  ,

    
             SizedBox(height: 20,) , 
   
              Text("مساعدك الذكى لتنظيم مهامك"  , 
              style: TextStyle(  color: white),)  ,
              Text("وتحقيق أهدافك بكل سهولة" , style: TextStyle( color: Colors.white54),) ,
                      
         
        ],
       ),
     ),
   



    ) ;
  }






}