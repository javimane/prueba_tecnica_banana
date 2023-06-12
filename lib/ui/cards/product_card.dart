
import 'package:flutter/material.dart';

import '../../models/http/producto.dart';
import '../../router/router.dart';
import '../../services/navigation_service.dart';


class ProductCard extends StatelessWidget {
  final Producto product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.title),
        subtitle: Text('Price'+ product.price.toString()),
        onTap: () {
       //   final productId = product.replaceAll(' ', '-').toLowerCase();
         NavigationService.navigateTo(Flurorouter.productoRoute);
         
    
        },
      ),
    );
  }
}