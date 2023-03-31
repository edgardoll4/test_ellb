import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:flutter/material.dart';

import 'flcahrt_pie_tst.dart';

class Statistic extends StatelessWidget {
  const Statistic({super.key});

  @override
  Widget build(BuildContext context) {
    DataStatistic _datos_statistic = new DataStatistic();
    // final ListStatistic = _datos_statistic._getStatistic();
    return Center(
      child: Scaffold(
        body: FutureBuilder<dynamic>(
          future: _datos_statistic._getStatistic(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // print('Datos en snapshot $snapshot');
              var sinAccion = snapshot.data['countConfirmar'] -
                  (snapshot.data['countAsistir'] +
                      snapshot.data['countAnular'] +
                      snapshot.data['countAmbos']);

              var asistir = snapshot.data['countAsistir'];
              var anular = snapshot.data['countAnular'];
              var ambos = snapshot.data['countAmbos'];
              var total = snapshot.data['countConfirmar'];

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                      child: Text('Estadisticas.\n',
                          style: TextStyle(
                              fontSize: 28,
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 25, 0, 255)))),
                  Text(
                    'countAsistir: $asistir. \n',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text('countAnular: $anular. \n',
                      style: const TextStyle(
                        fontSize: 18,
                      )),
                  Text('countAmbos: $ambos. \n',
                      style: const TextStyle(
                        fontSize: 18,
                      )),
                  Text('countSinAccion: $sinAccion\n',
                      style: const TextStyle(
                        fontSize: 18,
                      )),
                  Text('Total de platillas de confirmacion: $total. \n',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(200, 10, 100, 15))),
                ],
              );
            } else {
              return const Text("Sin data");
            }
          },
          initialData: const Center(
              child: CircularProgressIndicator(
            color: Color.fromARGB(200, 10, 150, 15),
          )),
        ),
      ),
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
      final asistir = jsonResponse['countAsistir'];
      final anular = jsonResponse['countAnular'];
      final ambos = jsonResponse['countAmbos'];
      final total = jsonResponse['countConfirmar'];
      // final datos (asistir, anular, ambos, sinAccion);

      // countAsistir","countAnular","countAmbos","countConfirmar"
      // print("Datos asistir: $asistir");
      // print("Datos anula: $anular");
      // print("Datos ambos: $ambos");
      // print("Datos sin accion: $sinAccion");
      // print("Datos Total: $total");

      final datos = [asistir, anular, ambos, sinAccion, total];
      print(jsonResponse);
      return jsonResponse;
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
      final asistir = jsonResponse['countAsistir'];
      final anular = jsonResponse['countAnular'];
      final ambos = jsonResponse['countAmbos'];
      final total = jsonResponse['countConfirmar'];
      // final datos (asistir, anular, ambos, sinAccion);

      // countAsistir","countAnular","countAmbos","countConfirmar"
      // print("Datos asistir: $asistir");
      // print("Datos anula: $anular");
      // print("Datos ambos: $ambos");
      // print("Datos sin accion: $sinAccion");
      // print("Datos Total: $total");

      final datos = [asistir, anular, ambos, sinAccion, total];
      // print(jsonResponse);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
