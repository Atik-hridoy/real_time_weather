import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel data;

  WeatherCard(this.data);

  @override
  Widget build(BuildContext context) {
    // Build a card to display weather information

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the city name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                Text(
                  data.city,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),

            // Display the weather description
            Text(
              data.desc,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 25),

            // Display the temperature
            Text(
              "${data.temp}°C",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
