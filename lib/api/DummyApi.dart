


import 'package:dio/dio.dart';

import '../services/local_storage.dart';


class DummyApi {

  static Dio _dio = Dio();
  
  static void configureDio() {

    // Base del url

     _dio.options.baseUrl = 'https://dummyjson.com';

    // Configurar Headers
    _dio.options.headers = {
      'Authorization': 'Bearer ${LocalStorage.prefs.getString('token')} ', 
      'Content-Type': 'application/json'
    };

  }

  static Future httpGet( String path ) async { //path de la peticion.
    try {
      
      final resp = await _dio.get(path);

      return resp.data;


    } on DioError catch (e) {
      print(e.response);
      throw('Error en el GET');
    }
  }

  static Future post( String path, Map<String, dynamic> data ) async { //post no es una palabra reservada

      final formData = FormData.fromMap(data);

      try {
        
        final resp = await _dio.post(path, data: formData );
        return resp.data;

      } on DioError catch (e) {
        print(e);
        throw('Error en el POST');
      }
    }


    static Future put( String path, Map<String, dynamic> data ) async {

      final formData = FormData.fromMap(data);

      try {
        
        final resp = await _dio.put(path, data: formData );
        return resp.data;

      } on DioError catch (e) {
        print(e);
        throw('Error en el PUT $e');
      }
    }





  

}