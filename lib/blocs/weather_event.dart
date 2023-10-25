
import 'package:final_630710316/blocs/weather_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/weather.dart';
import '../repositories/weather_repository.dart';

@immutable
abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final String city;
  FetchWeather(this.city);
}
class ClearWeather extends WeatherEvent {}
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = WeatherRepository();

  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();
      try {
        final weatherData = await weatherRepository.fetchData(event.city);
        final weather = Weather.fromJson(weatherData);
        yield WeatherLoaded(weather);
      } catch (e) {
        yield WeatherError('Failed to load weather data');
      }
    } else if (event is ClearWeather) {
      yield WeatherInitial();
    }
  }
}