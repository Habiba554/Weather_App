import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather2/models/weather_models.dart';
class WeatherServices
{
  Future<WeatherModels?> getWeather({required String CityName})async
  {
    WeatherModels? weather;
    try{
      String baseurl='http://api.weatherapi.com/v1';
      String apiKey='6e3fac5dcd944476a21202854232404';
      Uri url=Uri.parse('$baseurl/forecast.json?key=$apiKey&q=$CityName&aqi=no');
      http.Response response=await http.get(url);
      Map <String,dynamic> data=jsonDecode(response.body);
      var jasonData=data['forecast']['forecastday'][0];
      weather=WeatherModels.fromJson(data);
    }catch(e){
      print(e);
    }
    return weather;
  }

}