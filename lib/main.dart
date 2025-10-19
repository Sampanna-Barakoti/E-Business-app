import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const EBusinessApp());
}

class EBusinessApp extends StatelessWidget {
  const EBusinessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Business Nepal',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
