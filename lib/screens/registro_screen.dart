import 'package:flutter/material.dart';
import '../share_preferences/preferencias.dart';
import '../widgets/widgets.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({Key? key}) : super(key: key);

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
  bool mostrarContrasena = false;
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
                (Datos.pagina == 0)
                    ? 'Registro de usuario'
                    : 'Perfil del usuario',
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
                      _inputFormNumero(),
                      _inputFormContrasena(),
                      SwitchContrasena(),
                      CustomElevatedButton(context, "Guardar", ""),
                      CustomElevatedButton(context, "Regresar", ""),
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

  SwitchListTile SwitchContrasena() {
    return SwitchListTile(
      title: const Text('Mostrar contraseña'),
      value: mostrarContrasena,
      onChanged: (bool value) {
        setState(() {
          mostrarContrasena = value;
        });
      },
    );
  }

  Padding _inputFormContrasena() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        obscureText: !mostrarContrasena,
        initialValue: Datos.contrasenau,
        onChanged: (value) {
          Datos.contrasenau = value;
          setState(() {});
        },
        decoration: const InputDecoration(
          labelText: 'Contraseña',
          helperText: 'Contraseña',
        ),
        maxLength: 12,
        validator: (value) {
          if (value == null) return "Este campo es requerido";
          return value.length < 12 ? 'Minimo 12 caracteres' : null;
        },
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
        if (Datos.pagina == 0) {
          if (titulo == "Guardar") {
            if (Datos.contrasenau == '' ||
                Datos.nombreu == '' ||
                Datos.numero == '') {
              displayDialogAndroid2(context);
            } else {
              Navigator.pushNamed(context, 'registroInfanteScreen');
            }
          } else {
            Navigator.pop(context);
          }
        }
        if (Datos.pagina == 1) {
          if (titulo == "Guardar") {
            if (Datos.contrasenau == '' ||
                Datos.nombreu == '' ||
                Datos.numero == '') {
              displayDialogAndroid3(context);
            } else {
              Navigator.pushNamed(context, 'initialScreen');
            }
          } else {
            Navigator.pushNamed(context, 'initialScreen');
          }
        }
        // Navigator.pushNamed(context, ruta);
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
        initialValue: Datos.nombreu,
        onChanged: (value) {
          Datos.nombreu = value;
          setState(() {});
        },
        decoration: const InputDecoration(
          labelText: 'Nombre',
          helperText: 'Nombre de usuario',
        ),
        validator: (value) {
          if (value == null) return "Este campo es requerido";
        },
      ),
    );
  }
}

class _inputFormNumero extends StatefulWidget {
  const _inputFormNumero({Key? key}) : super(key: key);

  @override
  State<_inputFormNumero> createState() => _inputFormNumeroState();
}

class _inputFormNumeroState extends State<_inputFormNumero> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        initialValue: Datos.numero,
        onChanged: (value) {
          Datos.numero = value;
          setState(() {});
        },
        decoration: const InputDecoration(
          labelText: 'Numero',
          helperText: 'Numero telefonico',
        ),
        maxLength: 10,
        validator: (value) {
          if (value == null) return "Este campo es requerido";
          return value.length < 10 ? 'Minimo 10 caracteres' : null;
        },
      ),
    );
  }
}

void displayDialogAndroid2(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Titulo"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Faltan datos"),
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

void displayDialogAndroid3(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Titulo"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("No puedes dejar campos vacios"),
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
