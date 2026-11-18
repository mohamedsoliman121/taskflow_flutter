import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/settings_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الملف الشخصي')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // عرض الصورة بشكل تفاعلي
            Obx(() => Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: controller.selectedImage.value != null
                      ? FileImage(controller.selectedImage.value!) as ImageProvider
                      : (controller.profileImageUrl.value.isNotEmpty
                          ? NetworkImage(controller.profileImageUrl.value) as ImageProvider
                          : const NetworkImage('https://via.placeholder.com/150')),
                ),
                if (controller.isLoading.value)
                  const Positioned.fill(
                    child: CircularProgressIndicator(),
                  ),
              ],
            )),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                controller.pickImage();
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text('تغيير صورة البروفيل'),
            ),
          ],
        ),
      ),
    );
  }
}