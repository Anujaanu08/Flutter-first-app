import 'package:flutter/material.dart';
import 'package:flutter_application_1/product_detail.dart';
import 'package:flutter_application_1/product_provider.dart';
import 'package:provider/provider.dart';
import 'cart_notifier.dart';

class ProductPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Laptop",
      "price": "\$999",
      "image": "assets/Laptop.jpg",
      "quantity": 10
    },
    {
      "name": "Smartphone",
      "price": "\$699",
      "image": "assets/smartphone.jpg",
      "quantity": 5
    },
    {
      "name": "Headphones",
      "price": "\$199",
      "image": "assets/headphone.jpg",
      "quantity": 20
    },
    {
      "name": "Camera",
      "price": "\$499",
      "image": "assets/camera.jpg",
      "quantity": 15
    },
  ];

  final CartNotifier cartNotifier;

  ProductPage({required this.cartNotifier, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8, // Adjust the height of items
          ),
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                //responds to touch with a ripple effect.
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) =>
                            ProductProvider(products[index]['quantity']),
                        child: ProductDetailPage(
                          product: products[index],
                          cartNotifier: cartNotifier,
                        ),
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        products[index]['image'],
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      products[index]['name'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      products[index]['price'],
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
