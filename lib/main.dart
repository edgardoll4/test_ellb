// @dart=2.19
import 'dart:async';
import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_ellb/pages/home_page.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (details) {
      print('Flutter Error.');
      // dev.log(details.exceptionAsString(), stackTrace: details.stack);
      Zone.current.handleUncaughtError(
          details.exception, details.stack ?? StackTrace.empty);
    };
    runApp(const MyApp());
  }, (error, stack) {
    print('Zone Error.');
    if (kDebugMode) {
      dev.log(error.toString(), stackTrace: stack);
    } else {
      // Enviar a la centrar de errores
      dev.log('Error enviado', stackTrace: stack);
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test ELLB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
