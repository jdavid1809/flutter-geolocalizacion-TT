import 'package:flutter/material.dart';
import '../provider/scan_list_provider.dart';
import '../provider/uiprovider.dart';
import '../screens/screens.dart';
import '../share_preferences/preferencias.dart';
import '../widgets/widgets.dart';
import 'package:provider/provider.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedScreen;
    final scanListProvider = Provider.of<CoordenadasListProvider>(context);
    return Scaffold(
      drawer: SideMenu(),
      appBar: barratitulo(scanListProvider, currentIndex),
      // appBar: _barratitulo(/*scanListProvider*/),
      body: _HomeScreen(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: CustomPerfilButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar barratitulo(CoordenadasListProvider scanListProvider, int a) {
    if (a == 0) {
      return AppBar(
        backgroundColor: Colors.black,
        title: Text('Bienvenido ${Datos.nombreu}'),
        // title: Text('Geolocalización'),
      );
    } else {
      return AppBar(
        backgroundColor: Color.fromARGB(255, 25, 233, 32),
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: () {
              scanListProvider.borrarTodos();
            },
            icon: Icon(Icons.delete_forever_outlined),
          ),
        ],
      );
    }
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedScreen;
    // TODO: Temporal leer la base de datos
    // final tempScan = new ScanModel(valor: 'https://google.com');
    // DBProvider.db.nuevoScan(tempScan);
    // DBProvider.db.getScanById(6).then((scan) => print(scan!.valor));
    // DBProvider.db.getTodosScans().then(print);

    // final scanListProvider =
    // Provider.of<ScanListProvider>(context, listen: false);

    final scanListProvider =
        Provider.of<CoordenadasListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        // scanListProvider.cargarScansPorTipo('geo');
        return HomeScreen();
      case 1:
        scanListProvider.cargarCoordenadas();
        return HistorialScreen();
      default:
        return HomeScreen();
    }
  }
}
