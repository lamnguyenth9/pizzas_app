import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pizza_app/component/my_text_field.dart';
import 'package:flutter_pizza_app/screen/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _formKey= GlobalKey<FormState>();
  bool signInRequired = false;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool observerPassword = true;
  String? errorMsg;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc,SignInState>(
      listener: (context, state) {
        if(state is SignInSuccess){
          setState(() {
            signInRequired=false;
          });
        } else if(state is SignInLoading){
          setState(() {
            signInRequired=true;
          });
        } else if(state is SignInFailure){
          setState(() {
            signInRequired=false;
            errorMsg="Invalid email or password";
          });
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 20,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: MyTextField(
                controller: emailController, 
                hintText: "Email", 
                obccureText: false, 
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(CupertinoIcons.mail_solid),
                errorMsg: errorMsg,
                validator: (val){
                  if(val!.isEmpty){
                    return "Please fill in this field";
                  }else if(!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$').hasMatch(val)){
                    return "Please enter a valid email";
                  } return null;
                },),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: MyTextField(
                controller: passController, 
                hintText: "Password", 
                obccureText: observerPassword, 
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: Icon(CupertinoIcons.lock),
                errorMsg: errorMsg,
                validator: (val){
                  if(val!.isEmpty){
                    return "Please fill in this field";
                  }else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(val)){
                    return "Please enter a valid password";
                  } return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      observerPassword=!observerPassword;
                      if(observerPassword){
                        iconPassword=CupertinoIcons.eye_fill;
                      }else{
                        iconPassword=CupertinoIcons.eye_slash_fill;
                      }
                    });
                  }, icon: Icon(iconPassword),
                ),),
            ),
            SizedBox(height: 20,),
            !signInRequired
             ?SizedBox(
              width: MediaQuery.of(context).size.width*0.5,
              child: TextButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    context.read<SignInBloc>().add(SignInRequired(
                      email: emailController.text,
                      password: passController.text
                      
                    ));
                  }
                },
                style: TextButton.styleFrom(
                  elevation: 3.0,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)
                  )
                ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,

                ),),
              ),
             )
             : CircularProgressIndicator()
          ],
        )
        ),
      );
  }
}