import 'dart:convert';

import 'package:clima_flutter_weather_app/resources/geo_location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0;
  double longitude = 0;
  @override
  void initState() {
    super.initState();
    getLocations();
  }

  Future<void> getLocations() async {
    GeoLocation geo = GeoLocation();
    geo.getLocation();
    latitude = geo.latitude;
    longitude = geo.longitude;
  }

  Future<void> getData() async {
    Response response = await get(
      Uri.parse(
        'https://api.open-meteo.com/v1/forecast?$latitude=52.52&$longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m',
      ),
    );
    String data = response.body;
    var temperature = jsonDecode(data)['main']['temp'];
    var condition = jsonDecode(data)['weather'][0]['id'];
    var cityName = jsonDecode(data)['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            getLocations();
          },
          child: Column(children: [Text('Get Location'), Text('jj')]),
        ),
      ),
    );
  }
}
