import 'package:flutter/material.dart';
import 'package:flutter_examen1/src/pages/home_page.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});
  @override
  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<Noticias> {
  List<Noticia> noticias = [
     Noticia(
      titulo: 'Examenes Finales',
      descripcion: 'Este Q4 2023 esta por finalizar, anunciando la llegada de los examenes...',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Test_%28student_assessment%29.jpeg/1024px-Test_%28student_assessment%29.jpeg',
      fecha: '12/11/2023',
    ),
     Noticia(
      titulo: 'Congreso de Informatica',
      descripcion: 'La experincia informatica del congreso esta muy cerca de vivirse...',
      imageUrl: 'https://tryengineering.org/wp-content/uploads/bigstock-Concept-Of-Programming-Coding-375861967-1024x576.jpg',
      fecha: '18/11/2023',
    ),
    Noticia(
      titulo: 'Feria de Empleo',
      descripcion: 'Eres egresado o alumno activo de Ceutec y necesitas empleo...',
      imageUrl: 'https://www.altonivel.com.mx/wp-content/uploads/2019/12/buscar-empleo.jpg',
      fecha: '15/12/2023',
    ),
    Noticia(
      titulo: 'Yo decido mi Camino',
      descripcion: 'Tu puede elegir tu camino escogiendo la carrera que desees...',
      imageUrl: 'https://scontent.fsap7-1.fna.fbcdn.net/v/t39.30808-6/376273050_701348262023379_1841666347530572835_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_ohc=nZa_S_U9ssgAX-g0SYs&_nc_ht=scontent.fsap7-1.fna&oh=00_AfDCtLCQcOA9qRvVIW6IyAxVXs5nIMfr6k28rvj47xusqg&oe=6555FC34',
      fecha: '10/01/2024',
    ),// Añade más noticias aquí// Tus noticias aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTICIAS'),
        backgroundColor: Color.fromARGB(255, 1, 8, 104)),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (context, index) {
          return NoticiaCard(noticia: noticias[index]);
        },
      ),
    );
  }
}

class Noticia {
  String titulo;
  String descripcion;
  String imageUrl;
  String fecha;

  Noticia({
    required this.titulo,
    required this.descripcion,
    required this.imageUrl,
    required this.fecha,
  });
}

class NoticiaCard extends StatefulWidget {
  final Noticia noticia;

  NoticiaCard({required this.noticia});

  @override
  _NoticiaCardState createState() => _NoticiaCardState();
}

class _NoticiaCardState extends State<NoticiaCard> {
  bool? like;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.network(
              widget.noticia.imageUrl,
              fit: BoxFit.cover,
              height: 100, // Altura fija para todas las imágenes
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.noticia.titulo,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.noticia.descripcion,
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 10),
                  Text(widget.noticia.fecha),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TextButton(
                        child: Text('Me Gusta'),
                        style: TextButton.styleFrom(
                          primary: Color.fromARGB(255, 234, 234, 234),
                          backgroundColor: like == true ? Colors.green : null,
                        ),
                        onPressed: () {
                          setState(() {
                            like = true;
                          });
                        },
                      ),
                      TextButton(
                        child: Text('No Me Gusta'),
                        style: TextButton.styleFrom(
                          primary:  Color.fromARGB(255, 234, 234, 234),
                          backgroundColor: like == false ? Colors.red : null,
                        ),
                        onPressed: () {
                          setState(() {
                            like = false;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
