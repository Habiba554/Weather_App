import 'package:flutter/cupertino.dart';
import 'package:weather2/models/weather_models.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModels? _weatherData;
  String? cityName;
  set weatherData(WeatherModels? weather)
  {
    _weatherData=weather;
    notifyListeners();
  }
  WeatherModels? get weatherData => _weatherData;
}