import 'package:climatic_weather_app_video/services/location.dart';
import 'package:climatic_weather_app_video/services/networking.dart';
const apikey = '08534ca3331d6fc21dbcf1d6588f48b0';
const openWeatherMapURL= 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    Networkinghelper networkinghelper=Networkinghelper('$openWeatherMapURL?q=$cityName&appid=$apikey&units=metric');
   var weatherData= await networkinghelper.getdata();
   return weatherData;
  }

Future<dynamic> getlocationWeather()async{
  Location location=Location();
  await location.getlocationn();
  Networkinghelper networkinghelper = Networkinghelper(
      '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
  var weatherData = await networkinghelper.getdata();
  return weatherData;


}
  String getWeatherIcon(int condition) {
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

  String getMessage(int temp) {
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
