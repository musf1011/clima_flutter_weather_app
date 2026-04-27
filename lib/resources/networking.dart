import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future getData() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var temperature = jsonDecode(data)['main']['temp'];
      var condition = jsonDecode(data)['weather'][0]['id'];
      var cityName = jsonDecode(data)['name'];
      print(cityName);
      print(temperature);
      print(condition);
      return jsonDecode(data);
    } else {
      return response.statusCode;
    }
  }
}
