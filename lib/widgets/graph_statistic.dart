import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';

// import 'package:test_ellb/interfaces/datos_estadisticas.dart';
import '../resources/app_resources.dart';
import 'flcahrt_pie_tst.dart';
import 'indicator.dart';

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

          final asistir = datos[0];
          final anular = datos[1];
          final ambos = datos[2];
          final sinAccion = datos[3];
          final total = datos[4];

          List<PieChartSectionData> sectionsChart = [
            PieChartSectionData(
              value: double.parse(asistir.toStringAsFixed(2)),
              titleStyle: TextStyle(fontWeight: FontWeight.bold),
              title: "${_porcentaje(asistir, total, 2)} %",
              showTitle: true,
              color: Colors.orange,
              radius: 100,
            ),
            PieChartSectionData(
              value: double.parse(anular.toStringAsFixed(2)),
              title: "${_porcentaje(anular, total, 2)} %",
              titleStyle: TextStyle(fontWeight: FontWeight.bold),
              showTitle: true,
              color: Colors.blue,
              radius: 100,
            ),
            PieChartSectionData(
              titleStyle: TextStyle(fontWeight: FontWeight.bold),
              value: double.parse(ambos.toStringAsFixed(2)),
              title: "${_porcentaje(ambos, total, 2)} %",
              showTitle: true,
              color: Colors.red,
              radius: 100,
            ),
            PieChartSectionData(
              titleStyle: TextStyle(fontWeight: FontWeight.bold),
              value: double.parse(sinAccion.toStringAsFixed(2)),
              title: "${_porcentaje(sinAccion, total, 2)} %",
              showTitle: true,
              color: Colors.purple,
              radius: 100,
            ),
          ];

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/3309/3309960.png',
                width: 80,
              ),
              // Image.asset('assets/images/asd.png'),
              SizedBox(
                height: 20,
              ),
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
                'Asistir: $asistir => ( ${double.parse((asistir / total * 100).toStringAsFixed(2)).toString()} %)\n',
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
              Text(
                  'Anular: $anular => ( ${double.parse((anular / total * 100).toStringAsFixed(2)).toString()} %)\n',
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
              Text(
                  'Ambos: $ambos => ( ${double.parse((ambos / total * 100).toStringAsFixed(2)).toString()} %)\n',
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
              Text(
                  'Sin Accion: $sinAccion => ( ${double.parse((sinAccion / total * 100).toStringAsFixed(2)).toString()} %)\n',
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

              PieChartSample2(
                datos: sectionsChart,
              ),
              Positioned(
                  bottom: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const <Widget>[
                      Indicator(
                        color: Colors.orange,
                        text: 'Asistir',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Colors.blue,
                        text: 'Anular',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Colors.red,
                        text: 'Ambos',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Colors.purple,
                        text: 'Sin accion',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  )),
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
              ),
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/3309/3309960.png',
                width: 80,
              ),
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

  _porcentaje(a, b, c) {
    return double.parse((a / b * 100).toStringAsFixed(c)).toString();
  }

  _getStatistic() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    final endDatetime = DateTime.now().toUtc();
    final startDatetime = endDatetime.add(const Duration(days: -7));
    final end = endDatetime.toString();
    final start = startDatetime.toString();
    print('end: ${endDatetime}');
    print('start: ${endDatetime}');

    final url = Uri.https(
        'api-ws-prod.herokuapp.com/',
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
