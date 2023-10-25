import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_630710316/blocs/weather_bloc.dart';
import 'package:final_630710316/models/weather.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String city = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather for $city'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // แสดงข้อมูลสภาพอากาศสำหรับเมืองที่ผู้ใช้เลือก
            BlocProvider(
              create: (context) => WeatherBloc(),
              child: WeatherInfo(city: city),
            ),
          ],
        ),
      ),

    );
  }
}

class WeatherInfo extends StatelessWidget {
  final String city;

  WeatherInfo({required this.city});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if (state is WeatherLoading) {
          return CircularProgressIndicator();
        } else if (state is WeatherLoaded) {
          final weather = state.weather;
          return Column(
            children: <Widget>[
              Text('Temperature: ${weather.tempC}°C'),
              Text('Feels Like: ${weather.feelsLikeC}°C'),
              Text('Wind: ${weather.windKph} km/h'),
              Text('Humidity: ${weather.humidity}%'),
              Text('UV: ${weather.uv}'),
              Text('Condition: ${weather.condition.text}'),
              Image.network(weather.condition.icon),
            ],
          );
        } else {
          return Text('Select a city');
        }
      },
    );
  }
}