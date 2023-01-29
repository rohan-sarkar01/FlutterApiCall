import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/charger_status/view_model.dart';
import 'screens/charging_of_charger/view_model.dart';
import 'screens/command_run/view_model.dart';
import 'screens/home_screen/home_screen.dart';
// import 'package:flutter_api_callscreens/charger_status/view_model.dart';
// import 'package:flutter_api_callscreens/charging_of_charger/view_model.dart';
// import 'package:flutter_api_callscreens/command_run/view_model.dart';
// import 'package:flutter_api_callscreens/home_screen/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => ChargerStatusViewModel())),
        ChangeNotifierProvider(create: ((context) => ChargingViewModel())),
        ChangeNotifierProvider(create: ((context) => CommandRunViewModel()))
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
