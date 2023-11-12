import 'package:flutter/material.dart';
class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App CEUTEC'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Bienvenido a la App CEUTEC'),
      ),
    );
  }
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menú', style: TextStyle(color: Colors.white)),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          DrawerItem(icon: Icons.public, text: 'Noticias', onTap: () => Navigator.pushNamed(context, '/noticias')),
          DrawerItem(icon: Icons.monetization_on, text: 'El cambio de Monedas', onTap: () => Navigator.pushNamed(context, '/cambioMonedas')),
          DrawerItem(icon: Icons.list, text: 'Lista de tareas', onTap: () => Navigator.pushNamed(context, '/listaTareas')),
          DrawerItem(icon: Icons.podcasts, text: 'Podcast', onTap: () => Navigator.pushNamed(context, '/podcast')),
        ],
      ),
    );
  }
}

class DrawerItem extends ListTile {
  DrawerItem({required IconData icon, required String text, required VoidCallback onTap}) : super(
    leading: Icon(icon),
    title: Text(text),
    onTap: onTap,
  );
}
