

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/http/producto.dart';



class ProductosProvider extends ChangeNotifier {
  
List<Producto> productos = [];




void searchProducts(String query, String authToken) async {
  final url = 'https://dummyjson.com/products/search?q=$query';

  final headers = {
    'Authorization': 'Bearer $authToken',
    'Content-Type': 'application/json',
  };

  final dio = Dio();

  try {
    final response = await dio.get(url, options: Options(headers: headers));

    if (response.statusCode == 200) {
      final data = response.data;
      print(data);
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}

getAllProducts(String authToken) async {
  final url = 'https://dummyjson.com/products';
    final headers = {
    'Authorization': 'Bearer $authToken',
    'Content-Type': 'application/json',
  };

  final dio = Dio();

  try {
    final response = await dio.get(url, options: Options(headers: headers));

    if (response.statusCode == 200) {
      final data = response.data;
      print(data);
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}



 

 getProductById(String id , String authToken) async {
  final url = 'https://dummyjson.com/products/$id';

   final headers = {
    'Authorization': 'Bearer $authToken',
    'Content-Type': 'application/json',
  };

  final dio = Dio();

  try {
    final response = await dio.get(url, options: Options(headers: headers));

    if (response.statusCode == 200) {
      final data = response.data;
      print(data);
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}
}
 



