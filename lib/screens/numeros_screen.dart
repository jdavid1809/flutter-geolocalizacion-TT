import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class NumerosScreen extends StatelessWidget {
  const NumerosScreen({Key? key}) : super(key: key);

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

class _columna extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 244, 244, 244),
      appBar: AppBar(
        title: Text('Numeros de emergencia'),
        backgroundColor: Colors.black,
      ),
      drawer: SideMenu(),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 80, bottom: 70, left: 20, right: 20),
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 0.541),
          child: ListView(
            children: const [
              _opcion(
                titulo: 'Emergencias',
                icono: Icons.phone,
                number: '911',
              ),
              SizedBox(height: 40),
              _opcion(
                  titulo: 'Locatel',
                  icono: Icons.phone,
                  number: '55 56 58 11 11'),
              SizedBox(height: 40),
              _opcion(
                  titulo: 'Cruz Roja',
                  icono: Icons.phone,
                  number: '55 53 95 11 11'),
              SizedBox(height: 40),
              _opcion(
                  titulo: 'Protección civil',
                  icono: Icons.phone,
                  number: '55 51 28 00 00'),
              SizedBox(height: 40),
              _opcion(
                  titulo: 'Policia Federal', icono: Icons.phone, number: '088'),
              SizedBox(height: 40),
              _opcion(
                  titulo: 'Denuncia anónima',
                  icono: Icons.phone,
                  number: '089'),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _opcion extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final String number;
  const _opcion(
      {Key? key,
      required this.titulo,
      required this.icono,
      required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titulo,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        SizedBox(width: 30),
        Container(
          // color: Color.fromARGB(255, 25, 233, 32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 25, 233, 32),
          ),
          child: IconButton(
            onPressed: () async {
              //set the number here
              await FlutterPhoneDirectCaller.callNumber(number);
            },
            icon: Icon(icono),
            // hoverColor: Colors.red,
            // backgroundColor: Color.fromARGB(255, 25, 233, 32),
          ),
        ),
      ],
    );
  }
}
