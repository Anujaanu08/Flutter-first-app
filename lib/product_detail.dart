import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({required this.product, super.key});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 0;

  @override
  void initState() {
    super.initState();
    _quantity = widget.product['quantity'];
  }

  void _addToCart() {
    setState(() {
      if (_quantity > 0) _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product['name'])),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Set border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 20,
                    offset: Offset(6, 6), // More depth
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(
                    widget.product['image'],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.product['name'],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(widget.product['price'],
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                _addToCart();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${widget.product['name']} added to cart!"),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              icon: Icon(Icons.add_shopping_cart),
              label: Text("Add to Cart"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Available Quantity: $_quantity',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
          ],
        ),
      )),
    );
  }
}

// class ProductDetailPage extends StatelessWidget {
//   final Map<String, dynamic> product;

//   const ProductDetailPage({required this.product, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(product['name'])),
//       body: Center(
//           child: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: double.infinity,
//               height: 400,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20), // Set border radius
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.5),
//                     spreadRadius: 3,
//                     blurRadius: 20,
//                     offset: Offset(6, 6), // More depth
//                   ),
//                 ],
//                 image: DecorationImage(
//                   image: AssetImage(
//                     product['image'],
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               product['name'],
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(product['price'],
//                 style: TextStyle(fontSize: 18, color: Colors.grey)),
//             SizedBox(height: 20),
//             ElevatedButton.icon(
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text("${product['name']} added to cart!"),
//                     duration: Duration(seconds: 2),
//                     backgroundColor: Colors.green,
//                   ),
//                 );
//               },
//               icon: Icon(Icons.add_shopping_cart),
//               label: Text("Add to Cart"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 foregroundColor: Colors.white,
//                 padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
