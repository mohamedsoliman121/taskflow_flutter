import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/settings_controller.dart';
import 'package:taskflow_flutter/utils/locale_controller.dart';
import 'package:taskflow_flutter/views/screens/image_profile.dart';
import 'package:taskflow_flutter/views/widgets/card_widget.dart';
import 'package:taskflow_flutter/utils/theme_controller.dart';
class Settingsscreen extends StatelessWidget {
  Settingsscreen({super.key});

  final SettingsController controller = Get.find<SettingsController>();
  final ThemeController _themeController = Get.find<ThemeController>() ; 
 final MyLocaleController langcontroller = Get.find<MyLocaleController>();
  @override
  Widget build(BuildContext context) {

    return
    
    Scaffold(
    backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
    appBar: AppBar(title: Text("الاعدادات ")),
    body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              GestureDetector(
                onTap: () => {
               Get.to(() => ProfileScreen())
                }  ,
                child: CircleAvatar(
                  radius: 70, // نصف القطر الخارجي للإطار
                  backgroundColor: Colors.grey, // لون الإطار
                  child: CircleAvatar(
                    radius: 65, // نصف القطر الداخلي للصورة
                    child: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: 20),
          
     GetBuilder<ThemeController>(builder: (controller) {
       return          GestureDetector(
                onTap: () {
    
    
    _themeController.switchTheme(); 
                },
                child: CardWidget(
                  iconsone: Icon(Icons.dark_mode),
                  textone: Get.isDarkMode ?  "الوضع الداكن " : "الواضع المضىء",
                  texttow: "",
                  icontwo: Icon(Icons.light_mode),
                ),
              );
    
    
     }) , 
          
              CardWidget(
                iconsone: Icon(Icons.notifications),
                textone: "الاشعارات",
                texttow: "",
                icontwo: Icon(Icons.notifications_active),
              ),
          
              CardWidget(
                iconsone: Icon(Icons.lock),
                textone: "الخصوصية",
                texttow: "",
                icontwo: Icon(Icons.lock_clock),
              ),
          
              GestureDetector(
                onTap: () => {
            if (Get.locale?.languageCode == 'ar') {
                  langcontroller.changeLanguage('en', 'US')
                } else {
                  langcontroller.changeLanguage('ar', 'EG')
                }

                },
                child: CardWidget(
                  texttow: "العربية",
                  icontwo: Icon(Icons.sign_language),
                  iconsone: Icon(Icons.language),
                  textone: "اللغة",
                ),
              ),
          
              CardWidget(
                iconsone: Icon(Icons.access_alarm),
                textone: "حول التطبيق",
                texttow: "",
                icontwo: Icon(Icons.lock_clock),
              ),
          SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
    
    
                   
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 160 , vertical: 20) , 
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Set the border radius to 10 
          
                 ),
                ),
                child: Text(
                  "الخروج",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),




            ],
          ),
        ),
      ),
    ),
        );
    
    
    
  }
}
