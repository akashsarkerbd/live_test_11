import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherList(),
    );
  }
}

class WeatherList extends StatefulWidget {
 
  @override
  State<WeatherList> createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  final String jsonString = '''
  [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3
    }
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    List<dynamic> data = json.decode(jsonString);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Information App'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          var cityInfo = data[index];
          return Card(
            child: ListTile(
              title: Text('City: ${cityInfo["city"]}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Temperature: ${cityInfo["temperature"]}°C'),
                  Text('Condition: ${cityInfo["condition"]}'),
                  Text('Humidity: ${cityInfo["humidity"]}%'),
                  Text('Wind Speed: ${cityInfo["windSpeed"]} km/h'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
