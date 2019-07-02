class WeatherModel {

  final int cond;
  final int temp;
  final String city;

  WeatherModel({this.city, this.cond, this.temp});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: (json['main']['temp'] as double).toInt(),
      cond: json['weather'][0]['id'],
      city: json['name']
    );
  }

  String getWeatherIcon() {
    int condition = this.cond;
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    int temp = this.temp;

    if(cond == 0 && city == '') {
      return 'Error please try angin';
    }

    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
