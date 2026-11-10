


import 'package:flutter/material.dart';


class ContainerWidget extends StatelessWidget {
  final Color color ;
  final String  text;
  final int number ;
 
  final Widget icon ; 
  final Color textcolor ;

   const ContainerWidget({super.key,required this.color, required this.text, required this.number,  required this.icon, required this.textcolor});

  @override
  Widget build(BuildContext context) {
return   Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: color,
                          ),
                          width: 170,
                          height: 100,
          
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              icon , 
                                  SizedBox(width: 10),
                                  Text(
                                   text,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: textcolor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  number.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color:textcolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
  }

}