


import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../ui/views/busqueda_view.dart';
import '../ui/views/login_view.dart';





class BusquedaHandlers {

  static Handler busqueda = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);
     // Provider.of<AuthProvider>(context, listen: false)
      //  .setCurrentPageUrl( Flurorouter.busquedaRoute );

      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return BusquedaView();
      } else {
        return LoginView();
      }
    }
  );

}

