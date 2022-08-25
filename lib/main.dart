

import 'package:flutter/material.dart';
import 'package:world_clock/pages/loading.dart';
import 'package:world_clock/pages/choose_location.dart';
import 'package:world_clock/pages/home.dart';
void main() => runApp( MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/loading',
  routes: {
    '/loading': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));

