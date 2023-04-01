import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_ellb/widgets/graph_statistic.dart';
import 'dart:convert' as convert;

import '../widgets/circle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double circleOneSize = size.width * 0.9;
    final double circleTwoSize = size.width * 0.6;
    final Statistic estadisticas;

    return Scaffold(
      appBar: AppBar(
        shadowColor: Color.fromARGB(255, 55, 255, 0),
        backgroundColor: Color.fromARGB(255, 255, 55, 29),
        title: Text('Mi aplicacion'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 255, 226, 213),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: -circleOneSize * 0.4,
                right: -circleOneSize * 0.2,
                child: Circle(
                  size: circleOneSize,
                  colors: [
                    Color.fromARGB(255, 238, 0, 0),
                    Color.fromARGB(157, 205, 5, 20),
                  ],
                )),
            Positioned(
                top: -circleTwoSize * 0.55,
                left: -circleTwoSize * 0.2,
                child: Circle(
                  size: circleTwoSize,
                  colors: [
                    Color.fromARGB(255, 148, 79, 0),
                    Color.fromARGB(231, 255, 228, 20)
                  ],
                )),
            // Center(child: Text('Error')),
            Statistic(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          height: 100,
          child: Container(
              color: Colors.deepPurpleAccent,
              child: Center(
                child: Text(
                  '© ${DateTime.now().year} Api',
                  style: TextStyle(fontSize: 22),
                ),
              ))),
    );
  }

  // @override
  // void initState() {
  //   final newYearsEve = DateTime.now().toUtc().millisecondsSinceEpoch;
  //   final now = DateTime.now().toUtc();
  //   print(newYearsEve);
  //   print(now);
  //   _getStatistic();
  //   super.initState();
  // }

  // Future _getStatistic() async {
  //   // This example uses the Google Books API to search for books about http.
  //   // https://developers.google.com/books/docs/overview
  //   final endDatetime = DateTime.now().toUtc().millisecondsSinceEpoch;
  //   final startDatetime = endDatetime - 604800000;
  //   final end = endDatetime.toString();
  //   final start = startDatetime.toString();
  //   print('end: ${end}');
  //   print('start: ${start}');

  //   final url = Uri.https(
  //       'api-ws-prod.herokuapp.com',
  //       '/api/chat/statistics-button-pressed/',
  //       {'end-time': end, 'start-time': start});
  //   print(url);
  //   // Await the http get response, then decode the json-formatted response.
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final jsonResponse =
  //         convert.jsonDecode(response.body) as Map<String, dynamic>;

  //     final sinAccion = jsonResponse['countConfirmar'] -
  //         (jsonResponse['countAsistir'] +
  //             jsonResponse['countAnular'] +
  //             jsonResponse['countAmbos']);
  //     final asistir = jsonResponse['countAsistir'];
  //     final anular = jsonResponse['countAnular'];
  //     final ambos = jsonResponse['countAmbos'];
  //     final total = jsonResponse['countConfirmar'];

  //     // countAsistir","countAnular","countAmbos","countConfirmar"
  //     print("Datos asistir: $asistir");
  //     print("Datos anula: $anular");
  //     print("Datos ambos: $ambos");
  //     print("Datos sin accion: $sinAccion");
  //     print("Datos Total: $total");
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }
  // }
}
