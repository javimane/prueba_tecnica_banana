


import 'package:fluro/fluro.dart';

import 'admin_handlers.dart';
import 'busqueda_handlers.dart';


class Flurorouter {

  static final FluroRouter router = FluroRouter();

  static String rootRoute     = '/';

  // Auth Router
  static String loginRoute    = '/auth/login';
  
  static String busquedaRoute  = '/busqueda';
  static String productoRoute  = '/producto';
  
  
  


  static void configureRoutes() { //handler son los manejadores
    // Auth Routes
    router.define( rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none );
    router.define( loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none );
    

    // Busqueda
    router.define( busquedaRoute, handler: BusquedaHandlers.busqueda, transitionType: TransitionType.fadeIn );
    router.define( productoRoute, handler: BusquedaHandlers.busqueda, transitionType: TransitionType.fadeIn );

    

   
    

  }
  


}

