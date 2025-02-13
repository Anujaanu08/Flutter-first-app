import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

// Entry point of the Flutter application
void main() {
  runApp(MyApp());
}

// Root widget of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides debug banner
      title: 'Login Page', // Sets app title
      theme: ThemeData(primarySwatch: Colors.blue), // Sets theme color
      home: LoginPage(), // Sets LoginPage as the initial screen
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
