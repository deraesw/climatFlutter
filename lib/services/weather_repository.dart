
import 'location.dart';
import 'networking.dart';
import 'weather.dart';

class WeatherRepository {

  Future<WeatherModel> getCurrentWeatherFromCity(String cityName) async {
    try {
      NetworkHelper networkHelper = NetworkHelper(
        url: NetworkHelper.provideCurrentDayWeatherByNameUrl(cityName)
      );

      var response = await networkHelper.getData();
      if(response != null) {
        return WeatherModel.fromJson(response);
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }

  Future<WeatherModel> getCurrentWeather() async {
    try {
      Location location = Location();
      await location.getCurrentLocation();
      print('${location.longitude} + ${location.latitude}');

      NetworkHelper networkHelper = NetworkHelper(
          url: NetworkHelper.provideCurrentDayWeatherUrl(
              location.latitude, location.longitude)
      );

      var response = await networkHelper.getData();
      return WeatherModel.fromJson(response);
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

}