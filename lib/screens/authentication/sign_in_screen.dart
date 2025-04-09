import 'package:app_new/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:app_new/components/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bool signinRequired = false;

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
          SizedBox(height: 20,),

          !signinRequired? 
          SizedBox(
            width: MediaQuery.of(context).size.width*0.9,
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                elevation: 3, 
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)
                )
              ),
              onPressed: (){
                if (_formKey.currentState!.validate()) {
                  context.read<SignInBloc>().add(SignInRequired(
                    emailController.text, passwordController.text
                  ));
                  
                }
              }, child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5),
                child: Text('Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
                
                ),
              )),
          )

          : const CircularProgressIndicator()
        ],
      )
    );
  }
}