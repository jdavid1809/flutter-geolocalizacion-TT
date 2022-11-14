import 'package:flutter/material.dart';
import '../share_preferences/preferencias.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(155, 152, 152, 1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'initialScreen');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person_outline,
            ),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'registroScreen');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person_pin_circle_outlined,
            ),
            title: const Text('Perfil del infante'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'registroInfanteScreen');
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone_outlined),
            title: const Text('Numero de emergencia'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'numerosScreen');
              // Navigator.pushNamed(context, 'numerosScreen');
            },
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text('Cerrar sesión'),
            onTap: () {
              // Navigator.pop(context);
              Datos.pagina = 0;
              Datos.contrasena = '';
              Datos.nombre = '';
              Navigator.pushReplacementNamed(context, 'inicioScreen');
              // Navigator.pushNamed(context, 'numerosScreen');
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: const AssetImage('assets/logo2.png'),
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
