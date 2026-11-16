import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/home_controller.dart';
import 'package:taskflow_flutter/views/widgets/Container_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.menu_sharp),
        title: const Text('TaskFlow'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active_outlined),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1682685790910-1f3e5c7d8b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'مرحبا محمد',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                'اتمنى لك يوماً مليئاً بالانجاز',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // الكروت الإحصائية مغلفة بـ Obx لتتحدث الأرقام تلقائياً
              Obx(() => SizedBox(
                width: double.infinity,
                height: 180,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ContainerWidget(
                          color: Colors.blue.withOpacity(0.2),
                          text: "اجمالي المهام",
                          number: controller.totalTasks.value,
                          textcolor: Colors.blue,
                          icon: const Icon(Icons.data_usage_rounded, size: 20, color: Colors.blue),
                        ),
                        const SizedBox(width: 20),
                        ContainerWidget(
                          color: Colors.green.withOpacity(0.2),
                          text: 'المكتملة',
                          number: controller.completedTasks.value,
                          textcolor: Colors.green,
                          icon: const Icon(Icons.check_circle, size: 20, color: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ContainerWidget(
                          color: Colors.amber.withOpacity(0.2),
                          text: 'قيد التنفيذ',
                          number: controller.pendingTasks.value,
                          textcolor: Colors.amber,
                          icon: const Icon(Icons.access_time, size: 20, color: Colors.amber),
                        ),
                        const SizedBox(width: 20),
                        ContainerWidget(
                          color: Colors.red.withOpacity(0.2),
                          text: 'غير المكتملة',
                          number: controller.uncompletedTasks.value,
                          textcolor: Colors.red,
                          icon: const Icon(Icons.cancel, size: 20, color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              )),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'عرض الكل',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  const Text(
                    'المهام القادمة',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // عرض المهام القادمة من فايربيز باستخدام Obx و ListView
              Obx(() {
                if (controller.tasksList.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text('لا توجد مهام حالياً، أضف مهمتك الأولى!', style: TextStyle(color: Colors.grey)),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.tasksList.length,
                  itemBuilder: (context, index) {
                    var task = controller.tasksList[index];
                    return Card(
                      color: Colors.white,
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                              value: task['isCompleted'] ?? false,
                              onChanged: (val) {
                                // يمكنك هنا إضافة تحديث حالة المهمة في الفايربيز
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  task['title'] ?? '',
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "${task['date']} - ${task['time']}",
                                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}