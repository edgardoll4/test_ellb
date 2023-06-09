import 'package:fl_chart/fl_chart.dart';
// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
// import 'package:fl_chart_app/presentation/widgets/indicator.dart';
import 'package:flutter/material.dart';

import '../resources/app_resources.dart';
import 'indicator.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

class PieChartSample2 extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  List<PieChartSectionData> datos;
  PieChartSample2({super.key, required this.datos});

  @override
  State<StatefulWidget> createState() => PieChart2State(datos);
}

class PieChart2State extends State {
  int touchedIndex = -1;
  // ignore: prefer_typing_uninitialized_variables
  final datos;

  PieChart2State(this.datos);

  @override
  Widget build(BuildContext context) {
    print('Dentro del build: $datos');
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 150,
            width: 150,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 50,
                  sections: datos,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 100,
            height: 200,
          ),
        ],
      ),
    );
  }

  // List<PieChartSectionData> sectionsChart = [
  //   PieChartSectionData(
  //     value: 30,
  //     title: "10%",
  //     showTitle: true,
  //     color: Colors.orange,
  //     radius: 100,
  //   ),
  //   PieChartSectionData(
  //     value: 34,
  //     title: "45%",
  //     showTitle: true,
  //     color: Colors.blue,
  //     radius: 100,
  //   ),
  //   PieChartSectionData(
  //     value: 34,
  //     title: "15%",
  //     showTitle: true,
  //     color: Colors.red,
  //     radius: 100,
  //   ),
  //   PieChartSectionData(
  //     value: 43,
  //     title: "5%",
  //     showTitle: true,
  //     color: Colors.purple,
  //     radius: 100,
  //   ),
  // ];

  // List<PieChartSectionData> showingSections(datos) {
  //   final total = datos[4];
  //   final arr = datos;
  //   return List.generate(4, (i) {
  //     final isTouched = i == touchedIndex;
  //     final fontSize = isTouched ? 25.0 : 16.0;
  //     final radius = isTouched ? 60.0 : 50.0;
  //     const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
  //     switch (i) {
  //       case 0:
  //         return PieChartSectionData(
  //           color: AppColors.contentColorBlue,
  //           value: arr,
  //           title: '${arr / total * 100}%',
  //           radius: radius,
  //           titleStyle: TextStyle(
  //             fontSize: fontSize,
  //             fontWeight: FontWeight.bold,
  //             color: AppColors.mainTextColor1,
  //             shadows: shadows,
  //           ),
  //         );
  //       case 1:
  //         return PieChartSectionData(
  //           color: AppColors.contentColorYellow,
  //           value: arr[i],
  //           title: '${arr[i] / total * 100}%',
  //           radius: radius,
  //           titleStyle: TextStyle(
  //             fontSize: fontSize,
  //             fontWeight: FontWeight.bold,
  //             color: AppColors.mainTextColor1,
  //             shadows: shadows,
  //           ),
  //         );
  //       case 2:
  //         return PieChartSectionData(
  //           color: AppColors.contentColorPurple,
  //           value: arr[i],
  //           title: '${arr[i] / total * 100}%',
  //           radius: radius,
  //           titleStyle: TextStyle(
  //             fontSize: fontSize,
  //             fontWeight: FontWeight.bold,
  //             color: AppColors.mainTextColor1,
  //             shadows: shadows,
  //           ),
  //         );
  //       case 3:
  //         return PieChartSectionData(
  //           color: AppColors.contentColorGreen,
  //           value: arr[i],
  //           title: '${arr[i] / total * 100}%',
  //           radius: radius,
  //           titleStyle: TextStyle(
  //             fontSize: fontSize,
  //             fontWeight: FontWeight.bold,
  //             color: AppColors.mainTextColor1,
  //             shadows: shadows,
  //           ),
  //         );
  //       default:
  //         throw Error();
  //     }
  //   });
  // }
}
