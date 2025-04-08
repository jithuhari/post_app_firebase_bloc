import 'package:app_new/screens/authentication/sign_in_screen.dart';
import 'package:app_new/screens/authentication/sign_up_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text('Welcome Back !',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),),
                    SizedBox(height: kToolbarHeight,), 
                TabBar(
                  dividerColor: Colors.white,
                  unselectedLabelColor: Theme.of(context).colorScheme.onSurface.withOpacity(.5),
                  labelColor: Theme.of(context).colorScheme.onSurface,
                  controller: tabController,
                  tabs: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Sign In ',
                    
                    style: TextStyle(
                      fontSize: 18
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Sign Up ',
                    
                    style: TextStyle(
                      fontSize: 18
                    ),),
                  )
                ]),
                Expanded(
                  child: TabBarView(
                    controller: tabController ,
                    children: [
                    SignInScreen(), 
                    SignUpScreen()
                  ]),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}