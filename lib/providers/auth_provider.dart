
import 'package:flutter/material.dart';

import '../api/DummyApi.dart';
import '../models/http/auth_response.dart';
import '../models/usuario.dart';
import '../router/router.dart';
import '../services/local_storage.dart';
import '../services/navigation_service.dart';
import '../services/notifications_service.dart';




enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {

  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }


  login( String username, String password ) {

    final data = {
      'username': username,
      'password': password
    };

    DummyApi.post('https://dummyjson.com/auth/login', data ).then(
      (json) {
        print(json);
        final authResponse = AuthResponse.fromMap(json);
        this.user = authResponse.usuario;

        authStatus = AuthStatus.authenticated;
        LocalStorage.prefs.setString('token', authResponse.token );
        NavigationService.replaceTo(Flurorouter.busquedaRoute);

        DummyApi.configureDio();

        notifyListeners();

      }
      
    ).catchError( (e){
      print('error en: $e');
      NotificationsService.showSnackbarError('Usuario / Password no válidos');
    });

  }

  register(  String password, String name ) {
    
    final data = {
      'username': name,
      
      'password': password
    };

    DummyApi.post('/usuarios', data ).then(
      (json) {
        print(json);
        final authResponse = AuthResponse.fromMap(json);
        this.user = authResponse.usuario;

        authStatus = AuthStatus.authenticated;
        LocalStorage.prefs.setString('token', authResponse.token );
        NavigationService.replaceTo(Flurorouter.busquedaRoute);

        DummyApi.configureDio();
        notifyListeners();

      }
      
    ).catchError( (e){
      print('error en: $e');
      NotificationsService.showSnackbarError('Usuario / Password no válidos');
    });
    
    
    

  }

  Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('token');

    if( token == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    
    try {
      final resp = await DummyApi.httpGet('/auth');
      final authReponse = AuthResponse.fromMap(resp);
      LocalStorage.prefs.setString('token', authReponse.token ); //grabo en el localstorage el token para que no saque al usuario del login pero si quiero que la sesion se cierre no lo pongo a esto.
      
      this.user = authReponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;

    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

  }


  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }

}
