import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomPerfilButton extends StatelessWidget {
  const CustomPerfilButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 25, 233, 32),
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'registroScreen');
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        // final barcodeScanRes = 'geo:19.493763,-99.037492';
        // final barcodeScanRes = 'https://google.com';
        // final barcodeScanRes = '-1';
        // if (barcodeScanRes == '-1') return;
        // final scanListProvider =
        //     Provider.of<ScanListProvider>(context, listen: false);
        // final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        // launcherUrl(context, nuevoScan);
      },
      child: Icon(
        Icons.person_outline_outlined,
        size: 50,
        color: Colors.black,
      ),
      elevation: 0,
    );
  }
}
