import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pizza_app/app.dart';
import 'package:flutter_pizza_app/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBxOugQx9CbDsSnLqWI4QT-aWbA9ga3aUk', 
      appId: '1:825767050848:android:92d65ea91dbcca4b398d05', 
      messagingSenderId: '825767050848', 
      projectId: 'pizza-delivery-378a4')
  );
  Bloc.observer= SimpleBlocObserver();
  runApp( MyApp(userRepository: FirebaseUserRepo(),));
}

