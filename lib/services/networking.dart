import 'dart:convert';

import 'package:http/http.dart' as http;

const mainApiUrl = 'https://api.openweathermap.org/data/2.5/';
const apiKey = '277e526b9cc07fb2bda589154a124fab';

class NetworkHelper {

  final String url;

  NetworkHelper({this.url});

  Future getData() async {
    String request = url;
    print(url);
    http.Response response;
    try {
       response =  await http.get(request);
    } on Exception catch (e) {
      print(e);
      return null;
    }
    print('respnse');
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
    return null;
  }

  static String provideCurrentDayWeatherUrl(double lat, double long) {
    return '$mainApiUrl/weather?lat=$lat&lon=$long&units=metric&appid=$apiKey';
  }

  static String provideCurrentDayWeatherByNameUrl(String cityName) {
    return '$mainApiUrl/weather?q=$cityName&units=metric&appid=$apiKey';
  }
}