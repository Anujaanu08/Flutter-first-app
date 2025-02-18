import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/product_provider.dart';
import 'package:flutter_application_1/theme_provider.dart';
import 'package:provider/provider.dart';

// Entry point of the Flutter application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider(10)),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

// Root widget of the application
class MyApp extends StatelessWidget {
  // Add the named 'key' parameter
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides debug banner
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      initialRoute: '/login', // Start with Login Page
      routes: {
        '/login': (context) => LoginPage(),
        '/user': (context) => HomePage(),
      },
    );
  }
}

class CustomSnackBar {
  static void showSnackBar(BuildContext context, String message,
      {Color backgroundColor = Colors.redAccent,
      Color textColor = Colors.white,
      Duration duration = const Duration(seconds: 2),
      String? actionLabel, // Make actionLabel nullable
      VoidCallback? onRetry}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(16),
      duration: duration,
      action: actionLabel != null && onRetry != null
          ? SnackBarAction(
              label: actionLabel,
              textColor: textColor,
              onPressed: onRetry,
            )
          : null, // Only add action if both actionLabel and onRetry are provided
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
