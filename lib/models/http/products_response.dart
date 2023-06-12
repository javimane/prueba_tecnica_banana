// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromMap(jsonString);
import 'dart:convert';



import '../category.dart';
import 'producto.dart';

class ProductsResponse {
    ProductsResponse({
        required this.total,
        required this.productos,
    });

    int total;
    List<Producto> productos;

    factory ProductsResponse.fromJson(String str) => ProductsResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductsResponse.fromMap(Map<String, dynamic> json) => ProductsResponse(
        total: json["total"],
        productos: List<Producto>.from(json["productos"].map((x) => Categoria.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
    };
}


