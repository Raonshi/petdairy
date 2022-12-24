import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petdiary/firebase_options.dart';
import 'package:petdiary/page/auth/auth_provider.dart';
import 'package:petdiary/routes.dart';
import 'package:petdiary/style/theme.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: lightTheme,
      ),
    );
  }
}
