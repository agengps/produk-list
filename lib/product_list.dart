import 'package:flutter/material.dart';
import 'product_item.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Map<String, String?>> products = [
    {'name': 'Mie Goreng', 'description': 'Rp 3,250.'},
    {'name': 'Mie Rebus', 'description': 'Rp 2,800.'},
     {'name': 'Fanta', 'description': 'Rp 5,000.'},
    {'name': 'Good Day', 'description': 'Rp 7,000.'},
     {'name': 'Shampo', 'description': 'Rp 10,000.'},
    {'name': 'Sunslight', 'description': 'Rp 10,000.'},
     {'name': 'Pewangi', 'description': 'Rp 5,000.'},
    {'name': 'Masako', 'description': 'Rp 3,000.'},
    // Tambahkan produk lainnya sesuai kebutuhan
  ];

  List<Map<String, String?>> filteredProducts = [];

  @override
  void initState() {
    filteredProducts = List.from(products);
    super.initState();
  }

  void filterProducts(String query) {
    List<Map<String, String?>> filtered = products
        .where((product) =>
            product['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      filteredProducts = List.from(filtered);
    });
  }

  void deleteProduct(int index) {
    setState(() {
      filteredProducts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) => filterProducts(value),
            decoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Enter product name',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              return ProductItem(
                productNumber: index + 1,
                productName: filteredProducts[index]['name']!,
                productDescription: filteredProducts[index]['description']!,
                onDelete: () => deleteProduct(index),
              );
            },
          ),
        ),
      ],
    );
  }
}
