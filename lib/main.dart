import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:relatorios/shared/logic/shared_logic.dart';
import 'package:relatorios/shared/variables.dart';
import 'package:url_strategy/url_strategy.dart';

import 'firebase_options.dart';
import 'modules/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Relatorios",
      home: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            "assets/images/7Rank.png",
            height: 200,
          ),
        ),
      ),
    ),
  );
  await database.getDatabase();
  SharedLogic().loadExcel();
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: snackbarKey,
      navigatorKey: navigatorKey,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      debugShowCheckedModeBanner: false,
      title: "Relatorios",
      home: const HomePage(),
    );
  }
}
