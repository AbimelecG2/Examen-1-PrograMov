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
      titulo: 'Bacon ipsum dolor sit amet',
      descripcion: 'Porchetta turkey leberkas corned beef prosciutto ground...',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Fire_inside_an_abandoned_convent_in_Massueville%2C_Quebec%2C_Canada.jpg/800px-Fire_inside_an_abandoned_convent_in_Massueville%2C_Quebec%2C_Canada.jpg',
      fecha: '20/11/2023',
    ),
     Noticia(
      titulo: 'Bacon ipsum dolor sit amet',
      descripcion: 'Porchetta turkey leberkas corned beef prosciutto ground...',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/20100516_Vacas_Vilarromar%C3%ADs%2C_Oroso-8-1.jpg/1024px-20100516_Vacas_Vilarromar%C3%ADs%2C_Oroso-8-1.jpg',
      fecha: '20/11/2023',
    ),// Añade más noticias aquí// Tus noticias aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTICIAS'),
      ),
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
