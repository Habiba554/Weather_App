
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather2/models/weather_models.dart';
import 'package:weather2/providers/weather_provider.dart';


import 'Search_page.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
   WeatherModels? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SearchPage();
            }));
          }
              , icon: Icon(Icons.search))
        ],
      ),
      body: weatherData ==null? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ):Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weatherData!.getThemeColor(),
              weatherData!.getThemeColor()[300]!,
              weatherData!.getThemeColor()[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3,),
                Text(style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold),Provider.of<WeatherProvider>(context).cityName!,),
                Text('${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}' ,style: TextStyle(fontSize: 22.0,),),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Image.asset(weatherData!.getImage()),
              Text(weatherData!.temp.toInt().toString(),style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),),
                Column(
                  children: [
                    Text('Max temp : ${weatherData!.maxTemp.toInt()}'),
                    Text('Min temp : ${weatherData!.minTemp.toInt()}')
                  ],
                )
            ],),
            Spacer(),
            Text(weatherData!.weatherStateName,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            Spacer(flex: 5,)
          ],
        ),
      )
    );
  }
}
