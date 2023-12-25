class WeatherModel {
  final String temp;
  final String city;
  final String desc;

  WeatherModel({
    required this.temp,
    required this.city,
    required this.desc,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json['main']['temp'].toString(),
      city: json['name'],
      desc: json['weather'][0]['description'],
    );
  }
}
