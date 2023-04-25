import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';

/// The root 'StatelessWidget'
class MyApp extends StatelessWidget {
  /// An optional `key` parameter
  const MyApp({Key? key}) : super(key: key);

  // Override the build method to describe the UI of the app.
  @override
  Widget build(BuildContext context) {
    // Return a MaterialApp widget,which is the main container for Flutter app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
