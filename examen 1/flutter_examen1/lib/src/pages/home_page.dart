import 'package:flutter/material.dart';
class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APP CEUTEC'),
        backgroundColor: Color.fromARGB(255, 167, 20, 20)
      ),
      drawer: MainDrawer(),
      body: Center(
        child: ListView(
        children: <Widget>[
          DrawerItem(icon: Icons.public, text: 'Noticias', onTap: () => Navigator.pushNamed(context, '/noticias')),
          DrawerItem(icon: Icons.monetization_on, text: 'El cambio de Monedas', onTap: () => Navigator.pushNamed(context, '/cambioMonedas')),
          DrawerItem(icon: Icons.list, text: 'Lista de tareas', onTap: () => Navigator.pushNamed(context, '/listaTareas')),
          DrawerItem(icon: Icons.podcasts, text: 'Podcast', onTap: () => Navigator.pushNamed(context, '/podcast')),
        ],
      ),
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
         UserAccountsDrawerHeader(
              accountName: Text('MENU CEUTEC'),
              accountEmail: Text('abimelecg2@unitec.edu'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://scontent.fsap7-1.fna.fbcdn.net/v/t39.30808-6/335295715_948073409960525_8631161234188987870_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_ohc=K3cEouRb3kQAX-qpoie&_nc_ht=scontent.fsap7-1.fna&oh=00_AfBC9AoHdKZlkQkEhBfq0fw7f7PkMcZ_M3xS0BpCh3ycpg&oe=655532DD'), 
              ),
            decoration: BoxDecoration( color: Color.fromARGB(255, 167, 20, 20),
            ),
            ),
          DrawerItem(icon: Icons.home, text: 'Pagina Inicio', onTap: () => Navigator.pushNamed(context, '/home')),
          DrawerItem(icon: Icons.feed, text: 'Noticias', onTap: () => Navigator.pushNamed(context, '/noticias')),
          DrawerItem(icon: Icons.monetization_on, text: 'El cambio de Monedas', onTap: () => Navigator.pushNamed(context, '/cambioMonedas')),
          DrawerItem(icon: Icons.view_list_outlined, text: 'Lista de tareas', onTap: () => Navigator.pushNamed(context, '/listaTareas')),
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
