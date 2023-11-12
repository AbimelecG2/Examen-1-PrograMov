import 'package:flutter/material.dart';
import 'package:flutter_examen1/src/pages/home_page.dart';

class Moneda extends StatelessWidget {
  const Moneda({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambio de Monedas'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Página de Cambio de Monedas'),
      ),
    );
  }
}