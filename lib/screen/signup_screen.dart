import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pizza_app/component/my_text_field.dart';
import 'package:flutter_pizza_app/screen/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final passController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword= true;
  bool signUpRequired = false;

  bool containUperCase = false;
  bool containLowerCase= false;
  bool containNumer = false;
  bool containSpecialChar = false;
  bool contain8Length = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc,SignUpState>(
      listener: (context, state) {
        if(state is SignUpSuccess){
          setState(() {
            signUpRequired=false;
          });
        } else if(state is SignUpProcess){
          setState(() {
            signUpRequired=true;
          });
        } else if(state is SignUpFailure){
          return;
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  child:  MyTextField(
                  controller: emailController, 
                  hintText: "Email", 
                  obccureText: false, 
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(CupertinoIcons.mail_solid),
                  
                  validator: (val){
                    if(val!.isEmpty){
                      return "Please fill in this field";
                    }else if(!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$').hasMatch(val)){
                      return "Please enter a valid email";
                    } return null ;
                  },),
                ),
                SizedBox(height: 10,),
                SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                child: MyTextField(
                  controller: passController, 
                  hintText: "Password", 
                  obccureText: obscurePassword, 
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icon(CupertinoIcons.lock),
                  
                  onChanged: (val){
                    if(val!.contains(RegExp(r'[A-Z]'))){
                      setState(() {
                        containUperCase=true;
                      });
                    } else{
                      setState(() {
                        containUperCase=false;
                      });
                    }
                    if(val.contains(RegExp(r'[a-z]'))){
                      setState(() {
                        containLowerCase=true;
                      });
                    } else{
                      setState(() {
                        containLowerCase=false;
                      });
                    }
                    if(val.contains(RegExp(r'[0-9]'))){
                      setState(() {
                        containNumer=true;
                      });
                    } else{
                      setState(() {
                        containNumer=false;
                      });
                    }
                    if(val.contains(RegExp(r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])'))){
                      setState(() {
                        containSpecialChar=true;
                      });
                    }else{
                      setState(() {
                        containSpecialChar=false;
                      });
                    }
                    if(val.length>=8){
                     setState(() {
                        contain8Length=true;
                     });
                    } else{setState(() {
                      contain8Length=false;
                    });}
                      return null;
                  },
                  validator: (val) {
                    if(val!.isEmpty){
                      return "Please fill in this field";
                    }else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(val)){
                      return "Please enter a valid password";
                    } 
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword=!obscurePassword;
                        if(obscurePassword){
                          iconPassword=CupertinoIcons.eye_fill;
                        }else{
                          iconPassword=CupertinoIcons.eye_slash_fill;
                        }
                      });
                    }, icon: Icon(iconPassword),
                  ),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "* 1 uppercase",
                        style: TextStyle(
                          color: containUperCase
                          ? Colors.green
                          : Theme.of(context).colorScheme.onBackground
                        ),
                      ),
                      Text(
                        "* 1 lowercase",
                        style: TextStyle(
                          color: containLowerCase
                          ? Colors.green
                          : Theme.of(context).colorScheme.onBackground
                        ),
                      ),
                      Text(
                        "* 1 number",
                        style: TextStyle(
                          color: containNumer
                          ? Colors.green
                          : Theme.of(context).colorScheme.onBackground
                        ),
                      ),
                    ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        "* 1 special character",
                        style: TextStyle(
                          color: containSpecialChar
                          ? Colors.green
                          : Theme.of(context).colorScheme.onBackground
                        ),
                      ),
                      Text(
                        "* 8 minium character",
                        style: TextStyle(
                          color: contain8Length
                          ? Colors.green
                          : Theme.of(context).colorScheme.onBackground
                        ),
                      ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                child: MyTextField(
                  controller: nameController ,
                  hintText: "Name", 
                  obccureText: false, 
                  keyboardType: TextInputType.name,
                  prefixIcon: Icon(CupertinoIcons.person_2_fill),
                  validator: (val){
                    if(val!.isEmpty){
                      return "Please fill in this field";
                    } else if(val.length>30){
                      return " Name too long";
                    }
                    return null;
                  },),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                child: MyTextField(
                  controller: ageController ,
                  hintText: "Age", 
                  obccureText: false, 
                  keyboardType: TextInputType.name,
                  prefixIcon: Icon(CupertinoIcons.checkmark_seal_fill),
                  validator: (val){
                    if(val!.isEmpty){
                      return "Please fill in this field";
                    } else if(val.length>30){
                      return " Age too long";
                    }
                    return null;
                  },),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
        
              ),
              !signUpRequired
              ? SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: TextButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        MyUser myUser = MyUser.empty;
                        myUser.email = emailController.text;
                        myUser.name= nameController.text;
                        setState(() {
                          context.read<SignUpBloc>().add(
                            SignUpRequired(myUser, passController.text)
                          );
                        });
                      }
                    }, 
                    style: TextButton.styleFrom(
                      elevation: 3,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    )),  
              ): CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
      );
  }
}