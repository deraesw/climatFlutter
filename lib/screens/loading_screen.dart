import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather_repository.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  WeatherRepository weatherRepository = WeatherRepository();

  @override
  void initState() {
    getLocationData();

    super.initState();
  }

  void getLocationData() async {
    var weather = await weatherRepository.getCurrentWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(weatherModel: weather,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.greenAccent,
          size: 50.0,
        ),
      ),
    );
  }
}
