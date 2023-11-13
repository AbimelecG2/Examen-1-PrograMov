import 'package:flutter/material.dart';
import 'package:flutter_examen1/src/pages/home_page.dart';

class Podcast extends StatefulWidget {
  const Podcast({super.key});
  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<Podcast> {
  double _currentSliderValue = 0;
  bool isFavorite = false;
  // Esta función convertirá los segundos a un formato de tiempo MM:SS
  String _formatTime(double seconds) {
    int flooredSeconds = seconds.floor();
    int minutes = flooredSeconds ~/ 60;
    int remainingSeconds = flooredSeconds % 60;
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return '$formattedMinutes:$formattedSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PODCASTS'),
        backgroundColor: Colors.purple,
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        // Asegurarse de que el contenido no se desborde
        child: Column(
          children: <Widget>[
            SizedBox(height: 0), // Espacio adicional al principio
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Image.network(
                      'https://cdn-p.smehost.net/sites/301d3c12e5df4f5e99eb62fbca051dd8/wp-content/uploads/2023/01/155780E9-5098-4E8B-B546-C8C2373DF32D.jpeg',
                      width: 120,
                      height: 120,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Te lo prometo',
                            style: TextStyle(fontSize: 28),
                          ),
                          SizedBox(height: 10),
                          Text('Humbe'),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: isFavorite ? Colors.pink : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),
                        Text(
                          'Favorito',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),
            // Espacio después de la tarjeta
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon:
                        Icon(Icons.skip_previous, size: 60), // Icono más grande
                    onPressed: () {},
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(Icons.play_arrow, size: 80), // Icono más grande
                    onPressed: () {},
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(Icons.skip_next, size: 60), // Icono más grande
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            SizedBox(height: 50), // Espacio antes del deslizador
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.purple, // Color de la barra activa
                inactiveTrackColor:
                    Colors.purple[100], // Color de la barra inactiva
                thumbColor: Colors.purple, // Color de la pelotita
                overlayColor: Colors.purple.withAlpha(
                    0x29), // Color del efecto de pulsación con opacidad
                thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 12), // Pelotita más grande
                overlayShape: RoundSliderOverlayShape(
                    overlayRadius: 24), // Efecto de pulsación más grande
                trackHeight: 4.0, // Altura de la barra del deslizador
              ),
              child: Slider(
                value: _currentSliderValue,
                max: 249, // 4 minutos
                divisions: 249, // Dividir en segundos
                label: _formatTime(_currentSliderValue),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(_formatTime(
                      _currentSliderValue)), // Tiempo de inicio actualizado
                  Text('4:09'), // Tiempo final
                ],
              ),
            ),
            SizedBox(height: 30), // Espacio antes de Repeat y Shuffle
            ListTile(
              leading: Icon(Icons.repeat, size: 28), // Icono más grande
              title: Text('Repeat'),
              trailing: Checkbox(
                value: true,
                activeColor: Colors.purple,
                onChanged: (bool? value) {},
              ),
            ),
            Divider(height: 10),
            ListTile(
              leading: Icon(Icons.shuffle, size: 28), // Icono más grande
              title: Text('Shuffle'),
              trailing: Checkbox(
                value: false,
                activeColor: Colors.purple,
                onChanged: (bool? value) {},
              ),
            ),
            SizedBox(height: 20), // Espacio al final
          ],
        ),
      ),
    );
  }
}
