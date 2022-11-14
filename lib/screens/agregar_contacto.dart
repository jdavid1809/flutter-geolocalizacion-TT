import 'package:flutter/material.dart';
import 'package:sms_advanced/sms_advanced.dart';

import '../share_preferences/preferencias.dart';
import '../widgets/widgets.dart';

class AgregarContactoScreen extends StatefulWidget {
  const AgregarContactoScreen({Key? key}) : super(key: key);

  @override
  State<AgregarContactoScreen> createState() => _AgregarContactoScreenState();
}

class _AgregarContactoScreenState extends State<AgregarContactoScreen> {
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
    // final String titulo;
    // (Datos.pagina == 0) ? titulo ='Registro de infante':'Perfil del infante';
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
                'Agregar contacto extra',
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
                      _inputFormNumeroExtra(),
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

  ElevatedButton CustomElevatedButton(
      BuildContext context, String titulo, String ruta) {
    SmsSender sender = SmsSender();
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
        if (titulo == "Guardar") {
          if (Datos.numeroContactos < 4) {
            if (Datos.numeroContactos == 0) {
              sender.sendSms(SmsMessage(Datos.numeroi, Datos.numeroExtra1));
            }
            if (Datos.numeroContactos == 1) {
              sender.sendSms(SmsMessage(Datos.numeroi, Datos.numeroExtra2));
            }
            if (Datos.numeroContactos == 2) {
              sender.sendSms(SmsMessage(Datos.numeroi, Datos.numeroExtra3));
            }
            if (Datos.numeroContactos == 3) {
              sender.sendSms(SmsMessage(Datos.numeroi, Datos.numeroExtra4));
            }
            // sender.sendSms(SmsMessage(Datos.numeroi, Datos.numeroExtra1));
            Datos.numeroContactos = Datos.numeroContactos + 1;
            // displayDialogAndroid4(context);
            Navigator.pushReplacementNamed(context, 'initialScreen');
          }
          if (Datos.numeroContactos == 4) {
            displayDialogAndroid5(context);
          }
        }
        if (titulo == 'Regresar') {
          Navigator.pushReplacementNamed(context, 'initialScreen');
        }
        // Navigator.pushNamed(context, ruta);
      },
    );
  }
}

class _inputFormNumeroExtra extends StatefulWidget {
  const _inputFormNumeroExtra({Key? key}) : super(key: key);

  @override
  State<_inputFormNumeroExtra> createState() => _inputFormNumeroExtraState();
}

class _inputFormNumeroExtraState extends State<_inputFormNumeroExtra> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        initialValue: Datos.numeroExtra1,
        onChanged: (value) {
          if (Datos.numeroContactos < 4) {
            if (Datos.numeroContactos == 0) {
              Datos.numeroExtra1 = value;
              print('numero1: ' + Datos.numeroExtra1);
            }
            if (Datos.numeroContactos == 1) {
              Datos.numeroExtra2 = value;
              print('numero2: ' + Datos.numeroExtra2);
            }
            if (Datos.numeroContactos == 2) {
              Datos.numeroExtra3 = value;
              print('numero3: ' + Datos.numeroExtra3);
            }
            if (Datos.numeroContactos == 3) {
              Datos.numeroExtra4 = value;
              print('numero4: ' + Datos.numeroExtra4);
            }

            setState(() {});
          }
        },
        decoration: const InputDecoration(
          labelText: 'Numero',
          helperText: 'Numero extra de contacto',
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

void displayDialogAndroid4(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Titulo"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Numero agregado"),
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

void displayDialogAndroid5(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Titulo"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Lista de contactos llena"),
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
