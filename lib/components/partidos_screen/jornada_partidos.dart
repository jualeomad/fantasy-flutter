import 'package:fantasy_flutter/models/partido.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JornadaPartidos extends StatefulWidget {
  const JornadaPartidos({super.key});

  @override
  _JornadaPartidosState createState() => _JornadaPartidosState();
}

class _JornadaPartidosState extends State<JornadaPartidos> {
  int selectedJornada = 1; // Jornada seleccionada por defecto

  // Función para hacer la petición a la API
  Future<List<Partido>> fetchData(int jornada) async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/partidos/jornada/$jornada/'));

    if (response.statusCode == 200) {
      // Si la petición es exitosa, decodificamos la respuesta en UTF-8
      final utf8Decoded = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> data = json.decode(utf8Decoded);

      List<dynamic> partidosJson = data['partidos'];
      return partidosJson.map((json) => Partido.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Fila de Jornadas
        SizedBox(
          height: 50, // Altura fija para la fila de jornadas
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(38, (index) {
                int jornada = index + 1;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedJornada =
                          jornada; // Actualiza la jornada seleccionada
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: selectedJornada == jornada
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Jornada $jornada',
                        style: TextStyle(
                          color: selectedJornada == jornada
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        // Lista de partidos
        Expanded(
          child: FutureBuilder<List<Partido>>(
            future: fetchData(
                selectedJornada), // Llama a la función con la jornada seleccionada
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}',
                      style: const TextStyle(color: Colors.white)),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                    child: Text('No data found',
                        style: TextStyle(color: Colors.white)));
              } else {
                List<Partido> partidos = snapshot.data!;
                return GridView.count(
                  childAspectRatio: 2,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(partidos.length, (index) {
                    Partido partido = partidos[index];
                    return SizedBox(
                      width: 150,
                      height: 100,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                spreadRadius: 2)
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Escudo local
                            Image.asset(
                              "assets/escudos/${partido.local}.png",
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 8),
                            // Goles Local
                            Text(
                              partido.golesLocal.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                            // Goles Visitante
                            Text(
                              partido.golesVisitante.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                            // Escudo visitante
                            Image.asset(
                              "assets/escudos/${partido.visitante}.png",
                              width: 30,
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
