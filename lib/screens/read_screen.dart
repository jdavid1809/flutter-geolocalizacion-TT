import 'package:flutter/material.dart';
import '../provider/scan_list_provider.dart';
import '../share_preferences/preferencias.dart';
import 'package:provider/provider.dart';
// import 'package:prueba04/providers/coordenadas.dart';
import 'package:sms_advanced/sms_advanced.dart';
import '../widgets/widgets.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Background(),
        _body(),
      ],
    );
  }
}

class _body extends StatelessWidget {
  const _body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SmsQuery query = SmsQuery();
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _texto(
          tam: 30,
          text: 'Se mando la solicitud de ubicación.',
        ),
        const _texto(
          tam: 24,
          text: 'Seleccione "mostrar" en cuanto llegue la notificacion.',
        ),
        const SizedBox(height: 20),
        const Image(
          image: AssetImage('assets/loading.gif'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const SizedBox(
            child: _texto(tam: 24, text: 'Mostrar'),
          ),
          onPressed: () async {
            final coordenadasListProvider =
                Provider.of<CoordenadasListProvider>(context, listen: false);
            //Obtiene la lista de mensajes filtrados por numero
            List<SmsMessage> messages =
                await query.querySms(address: Datos.numeroi);
            //Nos posicionamos en el ultimo mensaje recibido
            String cadenaGPGGA = messages[0].body.toString();
            //Validacion de cadena GPGGA
            if (cadenaGPGGA.length > 40 &&
                (cadenaGPGGA.contains('N') || cadenaGPGGA.contains('S')) &&
                (cadenaGPGGA.contains('W') || cadenaGPGGA.contains('E'))) {
              //Separacion de la cadena
              int inicio = cadenaGPGGA.indexOf(':'); //Iicio de la cadena
              cadenaGPGGA = cadenaGPGGA.substring(inicio + 2, inicio + 33);
              var aux = cadenaGPGGA.split(','); //Separamos parametros

              // Obtener los valores de latitud, longitud y hora UTC
              String horaUTC = aux[0];
              String latitudS = aux[1];
              String longitudS = aux[2];
              //Convertir los valores a double y de DMM a DD
              double latitud = _convertirLatitud(latitudS);
              double longitud = _convertirLongitud(longitudS);
              String hora = _convertirHora(horaUTC);
              //Se almacenan en la base de datos
              final nuevaUbicacion = await coordenadasListProvider.nuevoScan(
                  hora, latitud.toString(), longitud.toString());
              //Se navega a la siguiente pantalla
              Navigator.pushNamed(
                context,
                'mostrarMapaScreen',
                arguments: nuevaUbicacion,
              );
            }
          },
        )
      ],
    ));
  }
}

class _texto extends StatelessWidget {
  final double tam;
  final String text;
  const _texto({
    Key? key,
    required this.tam,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: tam,
          decoration: TextDecoration.none),
    );
  }
}

double _convertirLatitud(String latitudS) {
  double latitud;
  if (latitudS.contains('S')) {
    latitudS = '-' + latitudS;
  }
  latitudS = latitudS.substring(0, latitudS.length - 1);
  latitudS = (double.parse(latitudS) / 100).toString();
  var latitudAux = latitudS.split('.');
  double latitud1 = double.parse(latitudAux[0]);
  // print(latitud1);
  // print(latitudAux[1]);
  double latitud2 = double.parse(
      ((double.parse('.' + latitudAux[1]) * 100 / 60).toString())
          .substring(1, latitudAux[1].length));

  // print(latitud2);
  if (latitud1 >= 0) {
    latitud = latitud1 + latitud2;
  } else {
    latitud = latitud1 - latitud2;
  }
  return latitud;
}

double _convertirLongitud(String longitudS) {
  double longitud;
  if (longitudS.contains('W')) {
    longitudS = '-' + longitudS;
  }
  longitudS = longitudS.substring(0, longitudS.length - 1);
  longitudS = (double.parse(longitudS) / 100).toString();
  var longitudAux = longitudS.split('.');
  double longitud1 = double.parse(longitudAux[0]);
  double longitud2 = double.parse(
      ((double.parse('.' + longitudAux[1]) * 100 / 60).toString())
          .substring(1, longitudAux[1].length));
  if (longitud1 > 0) {
    longitud = longitud1 + longitud2;
  } else {
    longitud = longitud1 - longitud2;
  }
  return longitud;
}

String _convertirHora(String horaS) {
  // print(horaS);
  int hora1aux = int.parse(horaS.substring(0, 2));
  String hora1;
  String hora2 = horaS.substring(2, 4);
  String hora3 = horaS.substring(4, 6);
  print(hora1aux);
  hora1aux = hora1aux - 5;
  if (hora1aux < 0) {
    hora1aux = 24 + hora1aux;
  }
  hora1 = hora1aux.toString();
  if (!(hora1.startsWith('1') || hora1.startsWith('2'))) {
    hora1.padLeft(2, '0');
  }
  return (hora1 + ':' + hora2 + ':' + hora3);
  // return horaS;
}
