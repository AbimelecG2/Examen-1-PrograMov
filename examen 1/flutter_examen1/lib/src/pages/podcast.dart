import 'package:flutter/material.dart';
import 'package:flutter_examen1/src/pages/home_page.dart';

class Podcast extends StatelessWidget {
  const Podcast({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Podcast'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Página de Podcast'),
      ),
    );
  }
}