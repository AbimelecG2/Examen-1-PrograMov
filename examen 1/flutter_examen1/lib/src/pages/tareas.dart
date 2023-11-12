import 'package:flutter/material.dart';
import 'package:flutter_examen1/src/pages/home_page.dart';

class Tareas extends StatelessWidget {
  const Tareas({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Página de Lista de Tareas'),
      ),
    );
  }
}
