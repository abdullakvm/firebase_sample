import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_sample/controller/authentication_controller.dart';
import 'package:firebase_sample/controller/login_screen_controller.dart';
import 'package:firebase_sample/firebase_options.dart';
import 'package:firebase_sample/views/Loginscreen/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthenticationController(),),
      ChangeNotifierProvider(create: (context) => LoginScreenController())],
      child: MaterialApp(home: LoginScreen()));
  }
}
