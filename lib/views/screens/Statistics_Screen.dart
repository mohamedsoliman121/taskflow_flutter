import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/Statistics_controller.dart';

class Statisticsscreen extends StatelessWidget {
  Statisticsscreen({super.key});

  final StatisticsController controller = Get.find<StatisticsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("الاحصائيات"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // 1. شريط الفترات الزمنية
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(.3)),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFilterButton("ثلاثة أشهر"),
                    _buildFilterButton("شهر"),
                    _buildFilterButton("أسبوع"),
                    _buildFilterButton("يوم"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 2. دائرة نسبة الإنجاز المتفاعلة
              Center(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Obx(() => Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        backgroundColor: Colors.blue.shade50,
                        value: controller.completionPercentage.value,
                        strokeWidth: 14,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.blue.shade600,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              controller.completionPercentageText.value,
                              style: const TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'معدل الانجاز',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              ),

              const SizedBox(height: 20),

              // 3. إجمالي المهام المتفاعل
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Text(
                      "${controller.totalTasks.value}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    )),
                    const Text("اجمالي المهام", style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),

              // 4. مربعات الحالة (المكتملة، قيد التنفيذ، متأخرة)
              Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatusCard("المكتملة", controller.completedTasks, Colors.green),
                    _buildStatusCard("قيد التنفيذ", controller.pendingTasks, Colors.amber),
                    _buildStatusCard("متأخرة", controller.overdueTasks, Colors.red),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // 5. المهام حسب الأولوية (أعمدة ديناميكية)
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Divider(),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "المهام حسب الأولوية",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildPriorityBar("عالية", controller.highPriorityCount.value, Colors.red),
                        _buildPriorityBar("متوسطة", controller.mediumPriorityCount.value, Colors.amber),
                        _buildPriorityBar("منخفضة", controller.lowPriorityCount.value, Colors.green),
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دوال مساعدة لتنظيف وترتيب الكود
  Widget _buildFilterButton(String title) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onPressed: () {},
      child: Text(title),
    );
  }

  Widget _buildStatusCard(String title, RxInt count, Color color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          Obx(() => Text("${count.value}", style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget _buildPriorityBar(String title, int count, Color color) {
    // حساب ارتفاع العمود بناءً على عدد المهام (مع وضع حد أدنى ليبقى مظهراً جيداً)
    double calculatedHeight = (count * 20.0).clamp(30.0, 120.0);
    
    return Column(
      children: [
        Text("$count", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 5),
        Container(
          width: 70,
          height: calculatedHeight,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}