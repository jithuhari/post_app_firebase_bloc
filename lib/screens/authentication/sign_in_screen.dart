import 'package:app_new/components/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/text_field.dart';

class SignInScreen extends StatefulWidget {
  
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController=TextEditingController() ;
  final passwordController = TextEditingController();
  String? _errorMsg;
  bool obscurePassword = true;
  IconData iconPassword =CupertinoIcons.eye_fill;

  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: MyTextField(
              controller: emailController,
              hintText:'Email',
              obscureText:false,
              keyboardType:TextInputType.emailAddress,
              prefixIcon:const Icon(CupertinoIcons.mail_solid),
              errorMsg:_errorMsg,
              validator:(val){
                if(val!.isEmpty){
                  return 'Please Fill This Field';
                }else if(!emailRexExp.hasMatch(val)){
                  return 'Please enter a valid email';
                }
                return null;
              }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: MyTextField(
              controller: passwordController,
              hintText:'Password',
              obscureText:obscurePassword,
              keyboardType:TextInputType.visiblePassword,
              prefixIcon:const Icon(CupertinoIcons.lock_fill),
              suffixIcon: IconButton(onPressed: (){
                setState(() {
                  obscurePassword = !obscurePassword;
                  if(obscurePassword){
                    iconPassword = CupertinoIcons.eye_fill;
                  }else{
                    iconPassword = CupertinoIcons.eye_slash_fill;
                  }
                });
              }, icon: Icon(iconPassword)),
              errorMsg:_errorMsg,
              validator:(val){
                if(val!.isEmpty){
                  return 'Please Fill This Field';
                }else if(!passwordRexExp.hasMatch(val)){
                  return 'Please enter a valid password';
                }
                return null;
              }
            ),
          ),
          SizedBox(height: 20,)
        ],
      )
    );
  }
}