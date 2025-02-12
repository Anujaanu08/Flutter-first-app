import 'package:flutter/material.dart';

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

// Login Page - Stateful widget to manage user input
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
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

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  final TextEditingController _emailController =
      TextEditingController(); // Controller for email input
  final TextEditingController _passwordController =
      TextEditingController(); // Controller for password input

  // Function to handle login action
  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      // Check if email and password match predefined values
      if (email == "admin@example.com" && password == "123456") {
        CustomSnackBar.showSnackBar(
          context,
          "Login Successful!",
          backgroundColor: Colors.green,
        );

        // Navigate to ProductPage after successful login

        //user can't go back to the login page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProductPage()),
        )

            //// user can go back to the login page by clicking back key
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ProductPage()),
            // );

            ;
      } else {
        CustomSnackBar.showSnackBar(
          context,
          "Invalid email or password",
          backgroundColor: Colors.redAccent,
          actionLabel: "Retry", // Add retry label
          onRetry: () {
            // Handle retry action, like focusing on email input
            print("Retry action pressed");
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Full width
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade400
            ], // Background gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(24),
              width: 400, // Box width for login form
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[800],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Email Input Field
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.blue),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Password Input Field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true, // Hides password input
                      decoration: InputDecoration(
                        labelText: "Password",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.blue),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 6 characters long";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    // Login Button
                    ElevatedButton(
                      onPressed: _login,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ProductPage - This screen displays a list of products available for purchase.
class ProductPage extends StatelessWidget {
  // List of products with their name, price, and corresponding icon
  final List<Map<String, dynamic>> products = [
    {"name": "Laptop", "price": "\$999", "image": Icons.computer},
    {"name": "Smartphone", "price": "\$699", "image": Icons.smartphone},
    {"name": "Headphones", "price": "\$199", "image": Icons.headset},
    {"name": "Smartwatch", "price": "\$299", "image": Icons.watch},
    {"name": "Camera", "price": "\$499", "image": Icons.camera},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar at the top with the title "Products"
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true, // Centers the title text
      ),

      // ListView.builder dynamically generates a list of product items
      body: ListView.builder(
        padding: EdgeInsets.all(16), // Adds padding around the list
        itemCount: products.length, // Total number of products to display

        itemBuilder: (context, index) {
          // Creating a card for each product item
          return Card(
            elevation: 4, // Adds shadow for a 3D effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            child: ListTile(
              // Icon representing the product type (Laptop, Smartphone, etc.)
              leading: Icon(
                products[index]['image'], // Fetches the icon from the list
                size: 40, // Sets the icon size
                color: Colors.blue, // Icon color
              ),

              // Product name with styling
              title: Text(
                products[index]['name'], // Fetches the product name
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              // Product price displayed below the title
              subtitle: Text(products[index]['price']),

              // Shopping cart icon on the right
              trailing: Icon(Icons.shopping_cart, color: Colors.blue),

              // Action when the user taps on a product item
              onTap: () {
                CustomSnackBar.showSnackBar(
                  context,
                  "${products[index]['name']} added to cart!",
                  backgroundColor: Colors.lightBlue,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
