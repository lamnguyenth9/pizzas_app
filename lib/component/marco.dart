import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MarcoWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const MarcoWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Column(
                                    
                                    children: [
                                      IconButton(
                                        onPressed: (){}, 
                                        icon: FaIcon(icon,color: Colors.red,)),
                                      Text(title)
                                    ],
                                  ),
                                )
                                );
  }
}