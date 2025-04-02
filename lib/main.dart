import 'package:app_new/app.dart';
import 'package:app_new/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const App(),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final FirebaseAuth auth =FirebaseAuth.instance;
//     User? user;
//     @override
//   void initState() {
    
//     super.initState();
//     auth.authStateChanges().listen((event) {
//       setState(() {
//         user =event;
//       });
//     },);
//   }
//   @override
//   Widget build(BuildContext context) {
    

    
//     return Scaffold(
//       appBar: AppBar(title: Text('Google SignIn')),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center
//         ,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
          
//           user !=null?Center(
//             child: Column(
              
//               children: [
//                 Image(image: NetworkImage(user!.photoURL!)),
//                 // Text(user!.displayName!),
//                 SizedBox(height: 15,),
//                 Text(user!.email!),
//                 MaterialButton(onPressed: (){
//                   auth.signOut();
//                 },child: Text("Sign Out"),)
//               ]
//             ),
//           ):
//           Center(
//             child: SignInButton(
//               buttonType: ButtonType.google,
//               onPressed: () {
//                 handleGoogleSignIn();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void handleGoogleSignIn(){
//     try {

//       GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
//       auth.signInWithProvider(googleAuthProvider);
      
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
// }
