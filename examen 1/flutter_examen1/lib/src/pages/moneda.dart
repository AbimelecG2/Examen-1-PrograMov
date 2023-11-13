import 'package:flutter/material.dart';
import 'package:flutter_examen1/src/pages/home_page.dart';

class Moneda extends StatefulWidget {
  @override
  _ConversorDivisasState createState() => _ConversorDivisasState();
}

class _ConversorDivisasState extends State<Moneda> {
  String monedaOrigen = 'Lempira';
  String monedaDestino = 'Dólar';
  double resultado = 0.0;
  final TextEditingController cantidadController = TextEditingController();

  void convertir() {
    double cantidad = double.tryParse(cantidadController.text) ?? 0.0;
    double tasa = obtenerTasa(monedaOrigen, monedaDestino);
    setState(() {
      resultado = cantidad * tasa;
    });
  }

  double obtenerTasa(String origen, String destino) {
    Map<String, double> tasas = {
      'Lempira-Dólar': 0.041,
      'Dólar-Lempira': 24.61,
      'Euro-Lempira': 26.30,
      'Lempira-Euro': 0.038,
      'Euro-Dólar': 1.07,
      'Dólar-Euro': 0.93,
    };
    return tasas['$origen-$destino'] ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cambio de Moneda'),
         backgroundColor: Color.fromARGB(255, 3, 113, 1), 
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Seleccionar Moneda',
                style: TextStyle(fontSize: 18),
              ),
              
           SizedBox(height: 20),
              Text(
                'ORIGEN                                                           CAMBIO',
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: monedaOrigen,
                      onChanged: (String? newValue) {
                        setState(() {
                          monedaOrigen = newValue!;
                        });
                      },
                      items: <String>['Lempira', 'Dólar', 'Euro']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 18),
                
                  Expanded(
                    child: DropdownButton<String>(
                      value: monedaDestino,
                      onChanged: (String? newValue) {
                        setState(() {
                          monedaDestino = newValue!;
                        });
                      },
                      items: <String>['Dólar', 'Lempira', 'Euro']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 25),
              TextField(
                controller: cantidadController,
                decoration: InputDecoration(
                  labelText: 'Cantidad',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: convertir,
                icon: Icon(Icons.monetization_on),
                label: Text(
                  'Convertir',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 3, 113, 1),
                ),
              ),
              SizedBox(height:  20),
              Text(
                'Resultado: $resultado',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}