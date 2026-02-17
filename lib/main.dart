import 'package:flutter/material.dart';

void main() {
  runApp(MiCelular());
}

class MiCelular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaInicio(),
    );
  }
}

class PantallaInicio extends StatelessWidget {

  final String fondoUrl =
      "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/ajolote.png";

  final String logoCometaUrl =
      "https://raw.githubusercontent.com/Alvarado-Ingrid-0456/Imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/logo.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {

          double ancho = constraints.maxWidth;

          int columnas = 4;
          if (ancho > 600 && ancho <= 1000) {
            columnas = 6;
          } else if (ancho > 1000) {
            columnas = 8;
          }

          return Stack(
            children: [

              // Fondo
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(fondoUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SafeArea(
                child: Column(
                  children: [

                    // Widget Clima
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wb_sunny,
                            color: Colors.yellow,
                            size: ancho > 600 ? 50 : 35,
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "28°C",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ancho > 600 ? 28 : 20,
                                ),
                              ),
                              Text(
                                "Soleado - México",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    // Grid ocupa el espacio restante
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GridView.count(
                          crossAxisCount: columnas,
                          mainAxisSpacing: 25,
                          crossAxisSpacing: 25,
                          children: [

                            iconoApp(Icons.shop, "Play Store"),
                            iconoApp(Icons.photo, "Galería"),
                            iconoApp(Icons.calendar_month, "Calendario"),
                            iconoApp(Icons.settings, "Ajustes"),
                            iconoApp(Icons.access_time, "Reloj"),
                            iconoApp(Icons.image_search, "Pinterest"),
                            iconoApp(Icons.sports_esports, "Play Juegos"),
                            iconoApp(Icons.shopping_cart, "Amazon"),

                            // Papelería Cometa
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    logoCometaUrl,
                                    height: ancho > 600 ? 70 : 50,
                                    width: ancho > 600 ? 70 : 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Papelería Cometa",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ancho > 600 ? 12 : 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget iconoApp(IconData icono, String nombre) {
    return Column(
      children: [
        Icon(
          icono,
          size: 45,
          color: Colors.white,
        ),
        SizedBox(height: 5),
        Text(
          nombre,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
