import 'package:flutter/material.dart';
import '../provider/scan_list_provider.dart';
import 'package:provider/provider.dart';
// import 'package:qrreader01/utils/utils.dart';

// import '../providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  const ScanTiles({Key? key}) : super(key: key);

  // const ScanTiles({});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<CoordenadasListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemBuilder: (_, i) => Dismissible(
        key: Key(scans[i].id.toString()),
        background: Container(
          color: Colors.greenAccent.shade700,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<CoordenadasListProvider>(context, listen: false)
              .borrarScanPorId(scans[i].id!);
        },
        child: ListTile(
          leading: Icon(
            Icons.map_outlined,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[i].latitud + ',' + scans[i].longitud),
          subtitle: Text(
              'id: ' + scans[i].id.toString() + '   Hora: ' + scans[i].hora),
          trailing: const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.grey,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              'mostrarMapaScreen',
              arguments: scans[i],
            );
          },
        ),
      ),
      itemCount: scans.length,
    );
  }
}
