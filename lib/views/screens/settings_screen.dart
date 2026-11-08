import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/settings_controller.dart';
import 'package:taskflow_flutter/views/widgets/card_widget.dart';

class Settingsscreen extends StatelessWidget {
  Settingsscreen({super.key});

  final SettingsController controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الاعدادات ")),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                CircleAvatar(
                  radius: 70, // نصف القطر الخارجي للإطار
                  backgroundColor: Colors.grey, // لون الإطار
                  child: CircleAvatar(
                    radius: 65, // نصف القطر الداخلي للصورة
                    child: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),

                CardWidget(
                  iconsone: Icon(Icons.dark_mode),
                  textone: "الوضع الداكن ",
                  texttow: "",
                  icontwo: Icon(Icons.light_mode),
                ),

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

                CardWidget(
                  texttow: "العربية",
                  icontwo: Icon(Icons.sign_language),
                  iconsone: Icon(Icons.language),
                  textone: "اللغة",
                ),

                CardWidget(
                  iconsone: Icon(Icons.access_alarm),
                  textone: "حول التطبيق",
                  texttow: "",
                  icontwo: Icon(Icons.lock_clock),
                ),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 150 , vertical: 20) , 
                  
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
