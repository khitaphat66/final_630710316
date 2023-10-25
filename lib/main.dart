import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_630710316/blocs/weather_bloc.dart';
import 'package:final_630710316/screens/weather_screen.dart';
import 'package:final_630710316/screens/city_selection_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      initialRoute: '/',
      routes: {
        '/': (context) => CitySelectionScreen(),
        '/weather': (context) => WeatherScreen(),
      },
    );
  }
}
