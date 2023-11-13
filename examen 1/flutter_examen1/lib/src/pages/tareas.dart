import 'package:flutter/material.dart';
import 'package:flutter_examen1/src/pages/home_page.dart';


class Tareas extends StatefulWidget {
  const Tareas({super.key});
  @override
  _ListaDeTareasState createState() => _ListaDeTareasState();
}

class Tarea {
  String usuario;
  String fecha;
  String descripcion;
  bool esFavorita;
  Tarea({required this.usuario, required this.fecha, required this.descripcion, this.esFavorita = false});
}

class _ListaDeTareasState extends State<Tareas> {
  final List<Tarea> _tareas = [];

  void _agregarTarea(String usuario, String fecha, String descripcion) {
    setState(() {
      _tareas.add(Tarea(usuario: usuario, fecha: fecha, descripcion: descripcion));
    });
    Navigator.of(context).pop(); // Cerrar el formulario una vez agregada la tarea
  }

  void _mostrarFormularioCreacionTarea() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Crear nueva tarea'),
          content: NuevoTareaFormulario(onFormSubmit: _agregarTarea),
        );
      },
    );
  }

  void _cambiarEstadoFavorito(int index) {
    setState(() {
      _tareas[index].esFavorita = !_tareas[index].esFavorita;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
        backgroundColor: Colors.orange,
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: _tareas.length,
        itemBuilder: (context, index) {
          Tarea tarea = _tareas[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(tarea.usuario),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(tarea.descripcion),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(''),
                      Row(
                        children: <Widget>[
                          Icon(Icons.calendar_today, size: 20.0),
                          Text('${tarea.fecha}'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              isThreeLine: true,
              trailing: IconButton(
                icon: Icon(tarea.esFavorita ? Icons.star : Icons.star_border),
                color: tarea.esFavorita ? Colors.yellow : null,
                onPressed: () => _cambiarEstadoFavorito(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
          backgroundColor: Colors.orange,
        onPressed: _mostrarFormularioCreacionTarea,
      ),
    );
  }
}
class NuevoTareaFormulario extends StatefulWidget {
  final Function(String usuario, String fecha, String descripcion) onFormSubmit;

  NuevoTareaFormulario({required this.onFormSubmit});

  @override
  _NuevoTareaFormularioState createState() => _NuevoTareaFormularioState();
}
class _NuevoTareaFormularioState extends State<NuevoTareaFormulario> {
  final _usuarioController = TextEditingController();
  final _fechaController = TextEditingController();
  final _descripcionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Asegura que el dialogo no ocupe toda la pantalla
      children: <Widget>[
        TextField(
          controller: _usuarioController,
          decoration: InputDecoration(labelText: 'Usuario'),
        ),
        TextField(
          controller: _fechaController,
          decoration: InputDecoration(labelText: 'Fecha de entrega'),
          keyboardType: TextInputType.datetime,
        ),
        TextField(
          controller: _descripcionController,
          decoration: InputDecoration(labelText: 'Descripción'),
        ),
        SizedBox(height: 20), 
        ElevatedButton(
          
           style: ElevatedButton.styleFrom(
    primary: Colors.orange, // Este es el color de fondo del botón
    onPrimary: Colors.white, // Este es el color del texto y los íconos
  ),
          child: Text('Agregar Tarea'),
        
          onPressed: () {
            widget.onFormSubmit(
              _usuarioController.text,
              _fechaController.text,
              _descripcionController.text,
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _usuarioController.dispose();
    _fechaController.dispose();
    _descripcionController.dispose();
    super.dispose();
  }
}
