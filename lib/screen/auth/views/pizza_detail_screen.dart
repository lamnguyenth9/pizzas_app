import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';import 'package:flutter_pizza_app/component/marco.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_repository/pizza_repository.dart';

class DetailScreen extends StatelessWidget {
 final Pizza pizza;
   DetailScreen(this.pizza,{ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(image: NetworkImage(pizza.picture)),
              ),
              
            ),
            SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3, 3),
                          blurRadius: 5
                        ),
                        
                      ]
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text( 
                                  pizza.description,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text( 
                                        "\$${pizza.price}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red
                                        ),

                                      ),
                                      Text( 
                                        "\$${pizza.discount}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          decoration: TextDecoration.lineThrough
                                        ),

                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          child: Row(
                            children: [
                              MarcoWidget(title: pizza.marco.calories.toString(), icon: FontAwesomeIcons.fire),
                                SizedBox(width: 5,),
                               MarcoWidget(title: pizza.marco.proteins.toString(), icon: FontAwesomeIcons.dumbbell,),
                                   SizedBox(width: 5,),
                                MarcoWidget(title: pizza.marco.fat.toString(), icon: FontAwesomeIcons.oilWell,),
                                   SizedBox(width: 5,),
                                MarcoWidget(title: pizza.marco.carbs.toString(), icon: FontAwesomeIcons.breadSlice,),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: TextButton(
                              onPressed: (){},
                              style: TextButton.styleFrom(
                                  elevation: 3,
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                  )
                              ),
                              child: Text("Buy now",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
          ],
        ),
        ),
    );
  }
}