import 'package:flutter/material.dart';
import '../provider/uiprovider.dart';
import 'package:provider/provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 25, 233, 32),
      onTap: (int i) => uiProvider.selectedScreen = i,
      currentIndex: uiProvider.selectedScreen,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.map_outlined,
            // color: Colors.green,
          ),
          icon: Icon(
            Icons.map_outlined,
            // color: Colors.white,
          ),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.history_outlined,
            // color: Colors.green,
          ),
          icon: Icon(
            Icons.history_outlined,
            // color: Colors.white,
          ),
          label: 'Historial',
        ),
      ],
    );
  }
}
