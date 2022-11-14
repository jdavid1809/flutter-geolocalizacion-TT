import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: Image(
        image: AssetImage('assets/fondo.jpg'),
        fit: BoxFit.fitHeight,
        height: double.infinity,
      ),
    );
  }
}
