import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final int productNumber;
  final String productName;
  final String productDescription;
  final VoidCallback onDelete;

  ProductItem({
    required this.productNumber,
    required this.productName,
    required this.productDescription,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(productName),
      subtitle: Text(productDescription),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
