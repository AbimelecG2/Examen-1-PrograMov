import 'package:flutter/material.dart';
import 'package:flutter_examen1/src/pages/home_page.dart';

class Noticias extends StatelessWidget {
  const Noticias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Página de Noticias'),
      ),
    );
  }
}