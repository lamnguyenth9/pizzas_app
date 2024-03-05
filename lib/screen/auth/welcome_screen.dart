import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pizza_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_pizza_app/screen/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_pizza_app/screen/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:flutter_pizza_app/screen/signin_screen.dart';
import 'package:flutter_pizza_app/screen/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController=TabController(
      initialIndex: 0,
      length: 2, 
      vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(20,-1.2),
                child: Container(
                  height: size.width,
                  width: size.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.tertiary
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(2.7, -1.2),
                child: Container(
                  width: size.width/1.3,
                  height: size.height/1.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),
              ),
              BackdropFilter(filter: ImageFilter.blur(sigmaX: 100,sigmaY: 100),
              child: Container(),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: size.height/1.4,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 50),
                      child: TabBar(
                        controller: tabController,
                        unselectedLabelColor: Theme.of(context).colorScheme.background,
                        labelColor: Theme.of(context).colorScheme.onBackground,
                        tabs: [
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "Sign in",
                              style: TextStyle(fontSize: 18),
                            ),
                            ),
                            Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "Sign up",
                              style: TextStyle(fontSize: 18),
                            ),
                            )
                        ]
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController, 
                          children: [
                            BlocProvider<SignInBloc>(
                              create: (context)=>SignInBloc(
                                 context.read<AuthenticationBloc>().userRepository
                              ),
                              child: SignInScreen(),),
                              BlocProvider<SignUpBloc>(
                              create: (context)=>SignUpBloc(
                               context.read<AuthenticationBloc>().userRepository
                              ),
                              child: SignUpScreen(),)
                          ],
                        )
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}