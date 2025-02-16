import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_notifier.dart';
import 'package:flutter_application_1/cart_page.dart';
import 'package:flutter_application_1/products_page.dart';
import 'package:flutter_application_1/profile_page.dart';
import 'package:flutter_application_1/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  
  int _selectedIndex = 0;
  // Define the cart notifier
  final CartNotifier cartNotifier = CartNotifier();
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      ProductPage(cartNotifier: cartNotifier),
      ProfilePage(),
      CartPage(cartNotifier: cartNotifier),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        
        actions: [
          IconButton(
            icon: Icon(Icons.sunny),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Dynamically change body
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
      ),
    );
  }
}