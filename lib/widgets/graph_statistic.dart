import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';

// import 'package:test_ellb/interfaces/datos_estadisticas.dart';
// import 'flcahrt_pie_tst.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  @override
  Widget build(BuildContext context) {
    DataStatistic datosStatistic = DataStatistic();
    // EstadisticasBtn ListStatistic = _datos_statistic._getStatistic();
    return FutureBuilder<dynamic>(
      future: datosStatistic._getStatistic(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List datos = [];
          datos.addAll(snapshot.data);
          print('Datos: ${snapshot.data}');
          // var sinAccion = snapshot.data['countConfirmar'] -
          //     (snapshot.data['countAsistir'] +
          //         snapshot.data['countAnular'] +
          //         snapshot.data['countAmbos']);

          final asistir = datos[0].toString();
          final anular = datos[1].toString();
          final ambos = datos[2].toString();
          final sinAccion = datos[3].toString();
          final total = datos[4].toString();

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/3309/3309960.png',
                width: 80,
              ),
              // Image.asset('assets/images/asd.png'),
              const Center(
                  child: Text('Estadisticas.\n',
                      style: TextStyle(
                          fontSize: 36,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 0, 255),
                          shadows: [
                            Shadow(
                                color: Color.fromARGB(99, 62, 52, 99),
                                blurRadius: 0.8,
                                offset: Offset(2, 1)),
                            Shadow(
                                color: Color.fromARGB(99, 131, 131, 89),
                                blurRadius: 0.5,
                                offset: Offset(2, 1))
                          ]))),
              Text(
                'Asistir: $asistir. \n',
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(0, 3, 101, 0.965),
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(99, 62, 52, 99),
                        blurRadius: 0.8,
                        offset: Offset(2, 1)),
                    Shadow(
                        color: Color.fromARGB(99, 131, 131, 89),
                        blurRadius: 0.5,
                        offset: Offset(2, 1))
                  ],
                ),
              ),
              Text('Anular: $anular. \n',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(0, 3, 101, 0.965),
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(99, 62, 52, 99),
                            blurRadius: 0.8,
                            offset: Offset(2, 1)),
                        Shadow(
                            color: Color.fromARGB(99, 131, 131, 89),
                            blurRadius: 0.7,
                            offset: Offset(2, 1))
                      ])),
              Text('Ambos: $ambos. \n',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(0, 3, 101, 0.965),
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(99, 62, 52, 99),
                            blurRadius: 0.8,
                            offset: Offset(2, 1)),
                        Shadow(
                            color: Color.fromARGB(99, 131, 131, 89),
                            blurRadius: 0.7,
                            offset: Offset(2, 1))
                      ])),
              Text('Sin Accion: $sinAccion.\n',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(0, 3, 101, 0.965),
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(99, 62, 52, 99),
                            blurRadius: 0.8,
                            offset: Offset(2, 1)),
                        Shadow(
                            color: Color.fromARGB(99, 131, 131, 89),
                            blurRadius: 0.7,
                            offset: Offset(2, 1))
                      ])),
              Text('Total de platillas de confirmacion: $total. \n',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(198, 1, 155, 9),
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(99, 62, 52, 99),
                            blurRadius: 0.8,
                            offset: Offset(1, 1)),
                        Shadow(
                            color: Color.fromARGB(99, 131, 131, 89),
                            blurRadius: 0.7,
                            offset: Offset(1, 1))
                      ])),
            ],
          );
        } else {
          // return const Center(child: Text("Sin data"));
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image.network(
              //   'https://elturf.com/generales_imagenes/loading.gif',
              //   width: 120,
              // ),
              Image.asset('assets/images/loading.gif'),

              Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 10, 150, 15),
              )),
              Text(
                '\nLoading...',
                style: TextStyle(
                    color: Color.fromARGB(200, 10, 200, 15), fontSize: 24),
              )
            ],
          );
        }
      },
      // initialData: const Center(
      //     child: CircularProgressIndicator(
      //   color: Color.fromARGB(200, 10, 150, 15),
      // )),
    );
  }

  _getStatistic() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    final endDatetime = DateTime.now().toUtc().millisecondsSinceEpoch;
    final startDatetime = endDatetime - 604800000;
    final end = endDatetime.toString();
    final start = startDatetime.toString();
    // print('end: ${end}');
    // print('start: ${start}');

    final url = Uri.https(
        'api-ws-prod.herokuapp.com',
        '/api/chat/statistics-button-pressed/',
        {'end-time': end, 'start-time': start});
    print(url);
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      final sinAccion = jsonResponse['countConfirmar'] -
          (jsonResponse['countAsistir'] +
              jsonResponse['countAnular'] +
              jsonResponse['countAmbos']);
      final countAsistir = jsonResponse['countAsistir'];
      final countAnular = jsonResponse['countAnular'];
      final countAmbos = jsonResponse['countAmbos'];
      final countConfirmar = jsonResponse['countConfirmar'];
      // final datos (asistir, anular, ambos, sinAccion);

      // countAsistir","countAnular","countAmbos","countConfirmar"
      // print("Datos asistir: $asistir");
      // print("Datos anula: $anular");
      // print("Datos ambos: $ambos");
      // print("Datos sin accion: $sinAccion");
      // print("Datos Total: $total");

      final datos = [
        countAsistir,
        countAnular,
        countAmbos,
        sinAccion,
        countConfirmar
      ];

      print('Datos de la peticion: $datos');

      return datos;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

_getTimeString() {
  final now = DateTime.now().toUtc().millisecondsSinceEpoch;
  print(now);
}

class DataStatistic {
  _getStatistic() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    final endDatetime = DateTime.now().toUtc().millisecondsSinceEpoch;
    final startDatetime = endDatetime - 604800000;
    final end = endDatetime.toString();
    final start = startDatetime.toString();
    // print('end: ${end}');
    // print('start: ${start}');

    final url = Uri.https(
        'api-ws-prod.herokuapp.com',
        '/api/chat/statistics-button-pressed/',
        {'end-time': end, 'start-time': start});
    // print(url);
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      final countsinAccion = jsonResponse['countConfirmar'] -
          (jsonResponse['countAsistir'] +
              jsonResponse['countAnular'] +
              jsonResponse['countAmbos']);
      final countAsistir = jsonResponse['countAsistir'];
      final countAnular = jsonResponse['countAnular'];
      final countAmbos = jsonResponse['countAmbos'];
      final countConfirmar = jsonResponse['countConfirmar'];
      // final datos (asistir, anular, ambos, sinAccion);

      // countAsistir","countAnular","countAmbos","countConfirmar"
      // print("Datos asistir: $asistir");
      // print("Datos anula: $anular");
      // print("Datos ambos: $ambos");
      // print("Datos sin accion: $sinAccion");
      // print("Datos Total: $total");

      final datos = [
        countAsistir,
        countAnular,
        countAmbos,
        countsinAccion,
        countConfirmar
      ];

      // print('Datos de la peticion: $datos');

      return datos;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
