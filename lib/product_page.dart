// product_page.dart
import 'package:flutter/material.dart';
import 'product_list.dart'; // Pastikan mengimpor ProductList

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: ProductList(), // Gunakan ProductList di sini
    );
  }
}
