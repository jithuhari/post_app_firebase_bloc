import 'package:app_new/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home/home_screen.dart';
import 'screens/authentication/welcome_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'InstaX',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.white,
          onSurface: Colors.black,
          primary: Color.fromRGBO(206, 147, 216, 1),
          onPrimary: Colors.black,
          secondary: Color.fromRGBO(244, 143, 177, 1),
          onSecondary: Colors.white,
          tertiary: Color.fromRGBO(255, 204, 128, 1),
          error: Colors.red,
          outline: Color(0xff424242 )
        )
      ),
      home: BlocBuilder<AuthenticationBloc,AuthenticationState>(
        
        builder: (context, state) {
        if(state.status == AuthenticationStatus.authenticated ){
          return const HomeScreen();
        }
        else{
          return const WelcomeScreen();
        }
      },),
    );
  }
}