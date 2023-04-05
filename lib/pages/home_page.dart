// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:test_ellb/widgets/graph_statistic.dart';
// import 'dart:convert' as convert;

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
    // final Statistic estadisticas;

    return Scaffold(
      // appBar: AppBar(
      //   shadowColor: Color.fromARGB(255, 55, 255, 0),
      //   backgroundColor: Color.fromARGB(255, 255, 55, 29),
      //   title: Text('Mi aplicacion en Flutter'),
      // ),
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
            Center(child: const Statistic()),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //     height: 50,
      //     child: Container(
      //         color: Colors.deepPurpleAccent,
      //         child: Center(
      //           child: Text(
      //             '© ${DateTime.now().year} ${DateTime.now().timeZoneName} Api',
      //             style: TextStyle(
      //               fontSize: 22,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ))),
    );
  }
}
