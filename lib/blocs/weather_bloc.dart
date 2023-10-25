import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/weather.dart';

class WeatherBloc extends Cubit<WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  void fetchWeather(String city) {
    // ทำการเรียก Repository เพื่อดึงข้อมูลจาก API
  }
}

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  WeatherLoaded(this.weather);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}
