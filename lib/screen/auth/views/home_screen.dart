import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pizza_app/screen/auth/blocs/get_pizza_bloc/bloc/get_pizza_bloc.dart';
import 'package:flutter_pizza_app/screen/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_pizza_app/screen/auth/views/pizza_detail_screen.dart';
import 'package:pizza_repository/pizza_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset("assets/1.png",
            scale: 9,
            ),
            SizedBox(width: 5,),
            Text("PIZZA",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
            ))
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(CupertinoIcons.cart)),
          IconButton(
            onPressed: (){
              context.read<SignInBloc>().add(SignOutRequired());
            }, 
            icon: Icon(CupertinoIcons.arrow_right_to_line))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GetPizzaBloc,GetPizzaState>(
          builder: (context, state) {
            if (state is GetPizzaSuccees){
              return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 9/17
            ),
          itemCount: state.pizza.length, 
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailScreen( state.pizza[index],
                  
                )));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(3,3),
                      color: Colors.grey,
                      blurRadius: 5
                    )
                  ]
                ),
                child: Column
                
                (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(state.pizza[index].picture),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: state.pizza[index].isVeg
                             ?Colors.red
                             :Colors.green
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                            child: Text(
                              state.pizza[index].isVeg
                              ?"VEG"
                              :"NON-VEG",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green.withOpacity(0.2)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                            child: Text(
                              state.pizza[index].spyci==1
                              ? "BLAND"
                              : state.pizza[index].spyci==2
                              ? "BALANCE"
                              :"SPYCI",

                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.green,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    state.pizza[index].name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),),
                  SizedBox(height: 4,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    state.pizza[index].description,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700
                    ),
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            "\$${state.pizza[index].price}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary
                            ),
                          ),),
                          SizedBox(width: 5,),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            "\$${state.pizza[index].discount}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                              decoration: TextDecoration.lineThrough
                            ),
                            
                          ),),
                          
                        ],
                      ),
                      IconButton(
                            onPressed: (){}, 
                            icon: Icon(CupertinoIcons.add_circled_solid))
                    ],
                  ),
                  
                ],),
              ),
            );
        
          },);
            } else if (state is GetPizzaProcess){
              return Center(
                child: CircularProgressIndicator(),
              );
            } else{
              return Center(
                child: Text("An Error occured..."),
              );
            }
            
          },
        )
      )
    );
  }
}