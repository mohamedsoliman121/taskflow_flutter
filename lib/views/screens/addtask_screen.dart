

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskflow_flutter/logices/controllers/addtask_controller.dart';


class AddtaskScreen extends  StatelessWidget{
   AddtaskScreen({super.key});
  final AddtaskController controller = Get.find<AddtaskController>() ;

  @override
  Widget build(Object context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("أضافة مهمة جديدة"),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
      ),

body: SingleChildScrollView(
  child: SafeArea(
    child: Column(
      children: [
    
    Container(
      margin: EdgeInsets.all(10),
    
      child: Align(
        alignment: AlignmentGeometry.topRight,
        child: TextField(
          keyboardType: TextInputType.text , 
          controller: controller.titlecontroller,
          decoration: InputDecoration(
            hintText: "ادخل عنوان المهمة" , 
            labelText: "عنوان المهمة" , 
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
            )
        
          ),
        ),
      ),
    ) ,

    Text("ادخل وصف المهمة") , 
    
  Container(
      margin: EdgeInsets.all(10),
    
      child: TextField(
        keyboardType: TextInputType.text , 
        controller: controller.titlecontroller,
        maxLines: 5,
      //  minLines: 5,
        decoration: InputDecoration(
        
          labelText:  " الوصف (اختيارى) " , 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          )
      
        ),
      ),
    ) ,
    Text('التاريخ والوقت') , 
    Container(
      padding: EdgeInsets.all(10),
      child: Row( children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.datetime , 
          
                        decoration: InputDecoration(
                 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              )
          
          
          ),
        
           onTap: () => {

           },
          ),
        ) ,
        
       SizedBox(width: 5,) , 
      
        Expanded(
          child: TextField(
            keyboardType: TextInputType.datetime , 
        
                 
          //  minLines: 5,
            decoration: InputDecoration(
                 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              )
          
            
          ),
                ),
        ) ,
      ]
      
      
      ),
    ) , 
    Text("ألاولوية") , 
    Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              
            ),
            
            onPressed: (){}, label:Row(
            children: [
              Text('عالية '),
           Container() , 
            ],
          )) , 
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              
            ),
              onPressed: (){}, label:Row(
            children: [
              Text('متوسطة '),
           Container() , 
            ],
          )) , 
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              
            ),
              onPressed: (){}, label:Row(
            children: [
              Text('منخفضة '),
           Container() , 
            ],
          )) , 
        ],
      ),
    ) , 
    
    Text("القائمة") , 
    DropdownButton(items: [], onChanged: (value) {}) ,
    
    
    
    
    ElevatedButton(
      
      style: ElevatedButton.styleFrom(
  padding: EdgeInsets.symmetric( horizontal: 100 , vertical: 20) , 
  backgroundColor: Colors.blueAccent
      ),
      onPressed: () {} , child: Text("اضافة مهمة جديدة"))
    
    
    
    
      ],
    ),
  ),
),

    );



  }
}