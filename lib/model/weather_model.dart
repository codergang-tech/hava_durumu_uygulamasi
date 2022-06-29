// ignore_for_file: non_constant_identifier_names



class Weather {
  
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;
  double? temp_max;
  double? temp_min;
  int? visibility;
  int? timezone;
  String? description;
  Weather({
   
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.feels_like,
    this.pressure,
    this.temp_max,
    this.temp_min,
    this.visibility,
    this.timezone,
    this.description,
  });

  Weather.fromJson(Map<String, dynamic> json) {
  
    cityName = json["name"];
    description = json["weather"][0]["description"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    temp_max = json["main"]["temp_max"];
    temp_min = json["main"]["temp_min"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    timezone = json["timezone"];
    feels_like = json["main"]["feels_like"];
    visibility = json["visibility"];
  }
}
