import 'package:flutter/material.dart';
import '../share_preferences/preferencias.dart';
import '../widgets/widgets.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        _columna(),
      ],
    );
  }
}

class _columna extends StatefulWidget {
  const _columna({Key? key}) : super(key: key);

  @override
  State<_columna> createState() => _columnaState();
}

class _columnaState extends State<_columna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Center(
          child: ListView(
            children: [
              Image(
                image: AssetImage('assets/logo2.png'),
                fit: BoxFit.scaleDown,
                height: 250,
              ),
              Text(
                'Inicio de sesión',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      _inputFormNombre(),
                      _inputFormContrasena(),
                      CustomElevatedButton(
                          context, "Iniciar sesión", "initialScreen"),
                      CustomElevatedButton(
                          context, "Registrar", "registroScreen"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton CustomElevatedButton(
      BuildContext context, String titulo, String ruta) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.green)),
      child: Container(
        width: double.infinity,
        child: Text(
          titulo,
          textAlign: TextAlign.center,
        ),
      ),
      onPressed: () {
        if (ruta == 'initialScreen') {
          if (((Datos.contrasena == Datos.contrasenau) &&
                  (Datos.nombre == Datos.nombreu)) &&
              (Datos.contrasena != '' && Datos.nombre != '')) {
            Datos.pagina = 1;
            Navigator.pushReplacementNamed(context, ruta);
          } else {
            displayDialogAndroid(context);
          }
        } else {
          Navigator.pushNamed(context, ruta);
        }
      },
    );
  }
}

class _inputFormNombre extends StatefulWidget {
  const _inputFormNombre({Key? key}) : super(key: key);

  @override
  State<_inputFormNombre> createState() => _inputFormNombreState();
}

class _inputFormNombreState extends State<_inputFormNombre> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        initialValue: Datos.nombre,
        onChanged: (value) {
          Datos.nombre = value;
          setState(() {});
        },
        decoration: const InputDecoration(
          labelText: 'Nombre',
          helperText: 'Nombre de usuario',
        ),
      ),
    );
  }
}

class _inputFormContrasena extends StatefulWidget {
  const _inputFormContrasena({Key? key}) : super(key: key);

  @override
  State<_inputFormContrasena> createState() => _inputFormContrasenaState();
}

class _inputFormContrasenaState extends State<_inputFormContrasena> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        obscureText: true,
        initialValue: Datos.contrasena,
        onChanged: (value) {
          Datos.contrasena = value;
          setState(() {});
        },
        decoration: const InputDecoration(
          labelText: 'Contraseña',
          helperText: 'Contraseña',
        ),
      ),
    );
  }
}

void displayDialogAndroid(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Titulo"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Contraseña o correo incorrecto"),
            SizedBox(height: 10),
            FlutterLogo(size: 100),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
