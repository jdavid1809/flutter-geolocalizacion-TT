import 'package:flutter/material.dart';
import '../provider/db_provider.dart';

import '../models/scan_model.dart';

class CoordenadasListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(
      String hora, String latitud, String longitud) async {
    final nuevoScan =
        ScanModel(hora: hora, latitud: latitud, longitud: longitud);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;

    scans.add(nuevoScan);
    notifyListeners();
    return nuevoScan;
  }

  cargarCoordenadas() async {
    final scans = await DBProvider.db.getTodosScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  // cargarScansPorTipo(String tipo) async {
  //   final scans = await DBProvider.db.getScanPorTipo(tipo);
  //   this.scans = [...scans!];
  //   tipoSeleccionado = tipo;
  //   notifyListeners();
  // }

  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
  }
}
