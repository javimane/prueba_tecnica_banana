
import 'package:flutter/material.dart';


import '../../models/http/producto.dart';
import '../../router/router.dart';
import '../../services/navigation_service.dart';

class ProductoView extends StatelessWidget {
  final Producto producto;

  const ProductoView({required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            NavigationService.navigateTo(Flurorouter.busquedaRoute);
          },
        ),
        title: const Text('Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Image(image: NetworkImage(producto.images.first)),
            const SizedBox(height: 16.0),
            Text(producto.title.replaceAll('-', ' ').toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text('Description: '+ producto.description),
            const SizedBox(height: 8.0),
             Text('Price: ${producto.price}'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Acción de agregar al carrito
              },
              child: const Text('Agregar al carrito'),
            ),
          ],
        ),
      ),
    );
  }
}