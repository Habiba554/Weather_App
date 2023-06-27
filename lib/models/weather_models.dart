import 'package:flutter/material.dart';

class WeatherModels
{
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModels({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName});

   factory WeatherModels.fromJson(dynamic data)
  {
    var jasonData=data['forecast']['forecastday'][0]['day'];
    return WeatherModels(
        date: DateTime.parse(data['location']['localtime']),
        temp: jasonData['avgtemp_c'],
        maxTemp: jasonData['maxtemp_c'],
        minTemp: jasonData['mintemp_c'],
        weatherStateName:jasonData['condition']['text']);
  }

  @override
  String toString()
  {
    return 'data = ';
  }
  String  getImage()
  {
    if(weatherStateName=='ThunderStorm' || weatherStateName=='Thunder' )
      {
        return 'assets/images/thunderstorm.png';
      }
    else if(weatherStateName=='Sunny' || weatherStateName=='Clear')
      {
        return 'assets/images/clear.png';
      }
    else if(weatherStateName=='Cloudy')
      {
        return 'assets/images/cloudy.png';
      }
    else if(weatherStateName=='Rainy')
      {
        return 'assets/images/rainy.png';
      }
    else if(weatherStateName=='Snow')
      {
        return 'assets/images/snow.png';
      }
    else
      {
        return 'clear.png';
      }
  }
  MaterialColor  getThemeColor()
  {
    if(weatherStateName=='ThunderStorm' || weatherStateName=='Thunder' )
    {
      return Colors.blue;
    }
    else if(weatherStateName=='Sunny' || weatherStateName=='Clear')
    {
      return Colors.orange;
    }
    else if(weatherStateName=='Cloudy')
    {
      return Colors.grey;
    }
    else if(weatherStateName=='Rainy')
    {
      return Colors.blueGrey;
    }
    else if(weatherStateName=='Snow')
    {
      return Colors.indigo;
    }
    else
    {
      return Colors.blue;
    }
  }

}
