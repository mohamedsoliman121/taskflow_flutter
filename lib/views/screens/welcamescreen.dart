import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/welcame_controller.dart';
import 'package:taskflow_flutter/utils/themecolors.dart';
import 'package:taskflow_flutter/views/widgets/Indicators.dart';

class Welcamescreen extends StatelessWidget {
  Welcamescreen({super.key});

  final controller = Get.find<WelcameController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.changePage(index);
        },
        children: [Pageone(), Pagetow()],
      ),
    );
  }
}

class Pagetow extends StatelessWidget {
  const Pagetow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/welcame.jpeg', width: 500, height: 250),
            SizedBox(height: 10),
            Text('WorkFlow مرحبا بك في' , style: TextStyle(fontWeight: FontWeight.w600),),
            SizedBox(height: 10),
            Text('نساعدك على تنظيم مهامك'),
             SizedBox(height: 10),
      Text('وإيجاز اهدافك بسهولة'),
      
              SizedBox(height: 10),
Indicators(color : Colors.blue) , 
  SizedBox(height: 10),
          ElevatedButton(onPressed: () {},
           
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue , 
            padding: EdgeInsets.symmetric(horizontal: 150  , vertical: 20) , 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
           child: Text('ابدأ الان' , style: TextStyle(color: Colors.white),)),
               

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   
                 
                    TextButton(onPressed: () {}, child: Text('تسجيل الدخول' , style: TextStyle(color: Colors.blueAccent),)),
                     Text("لديك حساب بالفعل ؟"),
                  ],
                ),
            
          ],
        ),
      ),
    );
  }
}

class Pageone extends StatelessWidget {
  Pageone({super.key});

  final WelcameController controller = Get.find<WelcameController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLight,

      body: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,

            colors: [
              Color(0xFF1746A2), // الشمال: أزرق داكن
              Color(0xFF246BFD), // اليمين: أزرق فاتح
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(
                      alpha: 0.15,
                    ), // لون ظل خفيف لإبراز الأيقونة
                    blurRadius: 16, // انتشار الظل
                    offset: Offset(0, 8), // مكان الظل لتحت شوية
                  ),
                ],
              ),
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF2563EB), // درجة أزرق فاتح
                    Color(0xFF1D4ED8), // درجة أزرق غامق
                  ],
                ).createShader(bounds),
                child: Icon(
                  Icons.task_alt_rounded,
                  color: Color(0xFF246BFD),
                  size: 65,
                ),
              ),

              // Icon(Icons.task_alt_rounded , color: Color(0xFF246BFD), size: 50,),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "TASK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
                Text(
                  "FLOW",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: accentCyan,
                    fontSize: 35,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Text(
              "خطط . نظم  . أنجز",
              style: TextStyle(color: white, fontSize: 30),
            ),

            SizedBox(height: 20),

            Text(
              "مساعدك الذكى لتنظيم مهامك",
              style: TextStyle(color: Colors.white54, fontSize: 25),
            ),
            Text(
              "وتحقيق أهدافك بكل سهولة",
              style: TextStyle(color: Colors.white54, fontSize: 25),
            ),

            SizedBox(height: 50),
      Indicators(color : Colors.white) , 
          ],
        ),
      ),
    );
  }
}
