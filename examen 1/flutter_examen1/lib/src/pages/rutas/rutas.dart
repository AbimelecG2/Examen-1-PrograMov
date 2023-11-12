
import 'package:flutter/material.dart';
import 'package:flutter_examen1/src/pages/home_page.dart';
import 'package:flutter_examen1/src/pages/noticias.dart';
import 'package:flutter_examen1/src/pages/tareas.dart';
import 'package:flutter_examen1/src/pages/podcast.dart';


Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (context) => HomePages(),
        '/noticias': (context) => Noticias(),
        '/cambioMonedas': (context) => MonedasPage(),
        '/listaTareas': (context) => TareasPage(),
        '/podcast': (context) => PodcastPage(),
  };
}