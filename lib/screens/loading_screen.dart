import 'dart:convert';

import 'package:clima_flutter_weather_app/resources/geo_location.dart';
import 'package:clima_flutter_weather_app/resources/networking.dart';
import 'package:flutter/material.dart';
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
    NetworkHelper networkHelper = NetworkHelper(
      'https://api.open-meteo.com/v1/forecast?$latitude=52.52&$longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            getLocations();
          },
          child: Column(children: [Text('Get Location'), Text('')]),
        ),
      ),
    );
  }
}
