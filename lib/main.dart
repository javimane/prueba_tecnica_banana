
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_banana/providers/productos_provider.dart';
import 'package:prueba_tecnica_banana/router/router.dart';
import 'package:prueba_tecnica_banana/services/local_storage.dart';
import 'package:prueba_tecnica_banana/services/navigation_service.dart';
import 'package:prueba_tecnica_banana/services/notifications_service.dart';
import 'package:prueba_tecnica_banana/ui/layouts/auth/auth_layout.dart';
import 'package:prueba_tecnica_banana/ui/layouts/splash/splash_layout.dart';
import 'package:prueba_tecnica_banana/ui/views/busqueda_view.dart';

import 'api/DummyApi.dart';
import 'providers/auth_provider.dart';
import 'providers/users_provider.dart';


 
void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  DummyApi.configureDio(); //pongo dio primero para que inicie la pagina, es un proceso sincrono.
  
  Flurorouter.configureRoutes();
  runApp(AppState());
}
 
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: ( _ ) => AuthProvider() ),
        ChangeNotifierProvider(create: ( _ ) => ProductosProvider() ),
        ChangeNotifierProvider(create: ( _ ) => UsersProvider() ),
     

      ],
      child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Challenge',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey, //servicios
      builder: ( _ , child ){
        
        final authProvider = Provider.of<AuthProvider>(context);

        if ( authProvider.authStatus == AuthStatus.checking )
          return SplashLayout();

        if( authProvider.authStatus == AuthStatus.authenticated ) {
          return BusquedaView();
        } else {
          return AuthLayout( child: child! );
        }
              

      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.5)
          )
        )
      ),
    );
    
  }
}