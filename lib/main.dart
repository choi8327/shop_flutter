import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testshop/screens/register.dart';
import 'package:flutter_testshop/firebase_options.dart';
import 'package:flutter_testshop/models/auth.dart';
import 'models/Provider.dart';
import 'screens/index.dart';
import 'screens/login.dart';
import 'screens/splash.dart';
import 'screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
        ChangeNotifierProvider(create: (_) => ItemProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Shop',
        routes: {
          '/index': (context) => IndexScreen(),
          '/login': (context) => LoginScreen(),
          '/splash': (context) => SplashScreen(),
          '/register': (context) => RegisterScreen(),
        },
        initialRoute: '/splash',
      ),
    );
  }
}
