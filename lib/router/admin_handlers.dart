

import 'package:fluro/fluro.dart';

import 'package:provider/provider.dart';
import 'package:prueba_tecnica_banana/ui/views/busqueda_view.dart';

import '../providers/auth_provider.dart';
import '../ui/views/login_view.dart';

class AdminHandlers {

  static Handler login = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);

      if ( authProvider.authStatus == AuthStatus.notAuthenticated )
        return LoginView();
      else 
        return BusquedaView();

    }
  );

 


}

