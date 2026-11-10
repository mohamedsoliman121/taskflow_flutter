import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/home_controller.dart';
import 'package:taskflow_flutter/views/widgets/Container_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.menu_sharp),

        title: const Text('TaskFlow'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active_outlined),
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1682685790910-1f3e5c7d8b6e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            ),
          ),
          const SizedBox(width: 2),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'مرحبا محمد',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
          
              Text(
                'اتمنني لك يوما مليلئا بالانجاز',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 220,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,




             
                      children: [

          
          
ContainerWidget(

color: Colors.blue.withOpacity(0.2),
text: "اجمالي المهام" ,
number:10 , 
textcolor: Colors.blue , 
icon:      Icon(
                                    Icons.data_usage_rounded,
                                    size: 20,
                                    color: Colors.blue,
                                  )

) , 
          
                        SizedBox(width: 20),


ContainerWidget(

color:Colors.green.withOpacity(0.2),
text:       'المكتملة',
number:5 , 
textcolor: Colors.green , 
icon:         Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: Colors.green,
                                  ),

) , 

                      
                      ],
                    ),
          
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [


ContainerWidget(

color:Colors.yellow.withOpacity(0.2),
text:       'قيد التنفيذ',
number:5 , 
textcolor: Colors.yellow, 
icon:         Icon(
                                    Icons.access_time , 
                                    size: 20,
                                    color: Colors.yellow,
                                  ),

) , 



                    
                        SizedBox(width: 20),

ContainerWidget(

color:Colors.red.withOpacity(0.2),
text:         'غير المكتملة',
number:0, 
textcolor: Colors.red , 
icon:         Icon(
                                    Icons.cancel , 
                                    size: 20,
                                    color: Colors.red,
                                  ),

) , 



                   
                      ],
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'عرض الكل',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  Text(
                    'المهام القادمة ',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),


...List.generate(
  5, // عدد العناصر المراد توليدها
  (index) {
    return Card(
  color: const Color.fromARGB(255, 255, 255, 255),
  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  

child: Padding(
  padding: const EdgeInsets.all(15),
  child: Row( 
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
    children: [
  Radio(value: false) , 
  
  
  
  Row(
    children: [
       Column(
        children: [
          Text(controller.cardwidget[index]) , 
          Text(controller.clockoftasks[index])
        ],
      ) , 
  Radio(value: false) , 
    //  Icon(Icons.import_contacts) , 
     
    ],
  ) , 
  
  ],  ),
)

) ;
  },
) ,



 
 




            ],
          ),
        ),
      ),
    );
  }
}
