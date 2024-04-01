import 'package:flutter/material.dart';
import 'package:purity_admin/features/products/model/products/product_model.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              'assets/images/logo_light.jpg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text('Cetaphil cream'),
            trailing: Text('Quantity: 5'),
          );
        });
  }
}
