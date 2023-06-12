
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/http/producto.dart';



import '../../providers/productos_provider.dart';
import '../../services/local_storage.dart';
import '../cards/product_card.dart';

class BusquedaView extends StatefulWidget {
  @override
  _BusquedaViewState createState() => _BusquedaViewState();
}

class _BusquedaViewState extends State<BusquedaView> {
  final TextEditingController _searchController = TextEditingController();
  List<Producto> _searchResults = [];
  String? token;

  @override
  void initState() {
    super.initState();
    token = LocalStorage.prefs.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    final prodProvider = Provider.of<ProductosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Challenge 2023'),
        backgroundColor: const Color(0xFF9E007E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(labelText: 'Buscar producto'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    final query = _searchController.text;
                    prodProvider.searchProducts(query, token!);

                    setState(() {
                      _searchResults = prodProvider.productos;

                      if (_searchResults.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => Builder(
                            builder: (context) => AlertDialog(
                              title: const Text('Producto no encontrado'),
                              content: const Text('No se encontró el producto ingresado.'),
                              actions: [
                                TextButton(
                                  child: const Text('Aceptar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    });
                  },
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: _searchResults
                  .map((product) => ProductCard(product: product))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
