import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather2/models/weather_models.dart';
import 'package:weather2/providers/weather_provider.dart';
import '../services/WeatherServices.dart';
class SearchPage extends StatelessWidget {
  String? CityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search for a city'),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextField(
            onChanged: (data)
            {
              CityName=data;
            },
            onSubmitted: (data) async{
              CityName=data;
              WeatherServices services=new WeatherServices();
              WeatherModels? weather= await services.getWeather(CityName: CityName!);
              Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName=CityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () async{
                    WeatherServices services=new WeatherServices();
                    WeatherModels? weather= await services.getWeather(CityName: CityName!);
                    Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
                    Provider.of<WeatherProvider>(context,listen: false).cityName=CityName;
                    Navigator.pop(context);
                  },
                    child: Icon(Icons.search)),
                label: Text('Search'),
                hintText: 'Enter your city',
                border: OutlineInputBorder()
            ),
          ),
        ),
      ),
    );
  }
}
