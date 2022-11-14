import 'package:flutter/material.dart';
import 'package:sms_advanced/sms_advanced.dart';

import '../share_preferences/preferencias.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      //widget usado para colocar dun widget encima del otro
      children: const [
        Background(), //Fondo de pantalla de auditoria propia
        _botones(), //Organizacion de los botones
      ],
    );
  }
}

class _botones extends StatelessWidget {
  const _botones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Creacion de una instancia SmsSender
    SmsSender sender = SmsSender();
    //Declaracion del numero al cual se le envia el mensaje de activacion
    // String address = '5560274003';
    String address = Datos.numeroi;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _botonEnviar(sender: sender, address: address),
        SizedBox(height: 30),
        _botonesContactos(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Mi numero: ' + Datos.numero,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  (Datos.numeroContactos >= 1)
                      ? ('Contacto 2: ' + Datos.numeroExtra1)
                      : '',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  (Datos.numeroContactos >= 2)
                      ? ('Contacto 3: ' + Datos.numeroExtra2)
                      : '',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  (Datos.numeroContactos >= 3)
                      ? ('Contacto 4: ' + Datos.numeroExtra3)
                      : '',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  (Datos.numeroContactos >= 4)
                      ? ('Contacto 5: ' + Datos.numeroExtra4)
                      : '',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ],
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Row _botonesContactos(BuildContext context) {
    SmsSender sender = SmsSender();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.greenAccent.shade700,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'agregarContacto');
            },
            // backgroundColor: Colors.green,
            child: const Text(
              'Agregar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.greenAccent.shade700,
          child: TextButton(
            onPressed: () {
              Datos.numeroExtra1 = '';
              Datos.numeroExtra2 = '';
              Datos.numeroExtra3 = '';
              Datos.numeroExtra4 = '';
              Datos.numeroContactos = 0;
              sender.sendSms(SmsMessage(Datos.numeroi, 'Limpiar001'));
              Navigator.pushReplacementNamed(context, 'initialScreen');
            },
            // backgroundColor: Colors.green,
            child: const Text(
              'Eliminar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _botonEnviar extends StatelessWidget {
  const _botonEnviar({
    Key? key,
    required this.sender,
    required this.address,
  }) : super(key: key);

  final SmsSender sender;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: Colors.greenAccent.shade700,
          child: TextButton(
            onPressed: () {
              //Utilizacion de la funcion sendSms el cual ocupa una direccion y un mensaje
              sender.sendSms(
                SmsMessage(
                  address,
                  'Peticion01',
                  // 'Prueba unitaria de envio de mensaje',
                  // '045733.0,1922.0106N,09900.4153W,1.0,2227.0,2,0.00,0.0,0.0,130522,07',
                  // '+QGPSLOC: 013316.0,1929.6244N,09902.2481W,1.1,2235.0,2,0.00,0.0,0.0,020622,06\n\nOK\n\n>\n+CMGS: 6Ä',
                  // '+QGPSLOC: 013145.0,1929.6249N,09902.2490W,1.2,2248.0,2,0.00,0.0,0.0,020622,05\n\nOK\n\n>',
                  // '052033.0,1929.6260N,09902.2500W,1.0,2227.0,2,0.00,0.0,0.0,130522,07',
                ),
              );
              Navigator.pushNamed(context, 'readScreen');
            },
            // backgroundColor: Colors.green,
            child: const Text(
              'Buscar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
