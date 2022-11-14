import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../provider/scan_list_provider.dart';
import '../provider/uiprovider.dart';
import '../screens/screens.dart';
import '../share_preferences/preferencias.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Datos.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    String ruta = '';
    if (Datos.pagina == 0) {
      ruta = 'inicioScreen';
    } else {
      ruta = 'initialScreen';
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => CoordenadasListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: ruta,
        routes: {
          'initialScreen': (_) => InitialScreen(),
          'homeScreen': (_) => HomeScreen(),
          'historialScreen': (_) => HistorialScreen(),
          'readScreen': (_) => ReadScreen(),
          'mostrarMapaScreen': (_) => MapaScreen(),
          'numerosScreen': (_) => NumerosScreen(),
          'inicioScreen': (_) => InicioScreen(),
          'registroScreen': (_) => RegistroScreen(),
          'registroInfanteScreen': (_) => RegistroInfanteScreen(),
          'agregarContacto': (_) => AgregarContactoScreen(),
        },
      ),
    );
  }
}
