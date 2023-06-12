
import 'package:flutter/material.dart';
import '../api/DummyApi.dart';
import '../models/http/users_response.dart';
import '../models/usuario.dart';


class UsersProvider extends ChangeNotifier {

  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex; // ? es opcional.
  
  UsersProvider() {
    this.getPaginatedUsers();
  }


  getPaginatedUsers() async {
    
    final resp = await DummyApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResp = UsersResponse.fromMap(resp);
    this.users = [ ... usersResp.usuarios ]; //destructuracion de usuarios por eso se pone los 3 puntos.
    isLoading = false;
    notifyListeners();
  }

  Future<Usuario?> getUserById( String id ) async {
    
    try {
      final resp = await DummyApi.httpGet('/usuarios/$id');
      final user = Usuario.fromMap(resp);
      return user;
      
    } catch (e) {
      return null;
    }
  }


  void sort<T>( Comparable<T> Function( Usuario user ) getField  ) { //la T es de tipo genérica, getField es que campo quiero.

    users.sort(( a, b ) {

        final aValue = getField( a );
        final bValue = getField( b );

        return ascending
          ? Comparable.compare(aValue, bValue) //para hacer comparaciones
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;

    notifyListeners();

  }


  void refreshUser( Usuario newUser ) {

    this.users = this.users.map(
      (user){
        if ( user.id == newUser.id ) {
          user = newUser;
        }

        return user;
      }
    ).toList();


    notifyListeners();
  }

}