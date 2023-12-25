import 'package:flutter/material.dart';
import 'package:weather/widgets/weather_card.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/utils/helpers.dart';
import 'path/to/anim_search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _textController = TextEditingController();
  Future<WeatherModel>? _myData;
  WeatherModel? _weatherData;
  bool _isLoading = false;
  String _errorMessage = '';

  Future<WeatherModel> getData(bool isCurrentCity, String cityName) async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      WeatherModel weatherData = await WeatherService().getWeatherData(cityName);
      setState(() {
        _weatherData = weatherData;
      });
      return weatherData;
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load weather data. Please try again.';
      });
      throw Exception('Failed to load weather data: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Weather App'),
      ),
      body: FutureBuilder<WeatherModel>(
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color.fromARGB(255, 65, 89, 224),
                  Color.fromARGB(255, 83, 92, 215),
                  Color.fromARGB(255, 86, 88, 177),
                  Color(0xfff39060),
                  Color(0xffffb56b),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
              child: Column(
                children: [
                  AnimSearchBar(
                    rtl: true,
                    width: 400,
                    color: Color(0xffffb56b),
                    textController: _textController,
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 26,
                    ),
                    onSuffixTap: () async {
                      _textController.text == ""
                          ? print("No city entered")
                          : _myData = getData(false, _textController.text);

                      FocusScope.of(context).unfocus();
                      _textController.clear();
                    },
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      letterSpacing: 2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_isLoading) CircularProgressIndicator()
                        else if (_errorMessage.isNotEmpty)
                          Center(
                            child: Text(
                              _errorMessage,
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        else if (_weatherData != null)
                          WeatherCard(_weatherData!)
                        else
                          Text('Enter a city to get weather data'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        future: _myData,
      ),
    );
  }
}
