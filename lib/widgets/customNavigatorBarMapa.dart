import 'package:flutter/material.dart';
import 'package:geolocalizacion_v3/share_preferences/preferencias.dart';
import 'package:sms_advanced/sms_advanced.dart';

class CustomNavigatorBarMapa extends StatelessWidget {
  const CustomNavigatorBarMapa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int i) {
        if (i == 0) {
          Navigator.pushReplacementNamed(context, 'initialScreen');
        }
        if (i == 1) {
          SmsSender sender = SmsSender();
          sender.sendSms(SmsMessage(Datos.numeroi, 'Peticion01'));
          Navigator.pushReplacementNamed(context, 'readScreen');
        }
      },
      currentIndex: 0,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home
              // color: Colors.green,
              ),
          icon: Icon(Icons.home
              // color: Colors.white,
              ),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.search_outlined,
            // color: Colors.green,
          ),
          icon: Icon(
            Icons.search_outlined,
            // color: Colors.white,
          ),
          label: 'Buscar',
        ),
      ],
    );
  }
}
