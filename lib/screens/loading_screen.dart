import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Location location = Location();
    await location.getCurrentLocation();
    print(location.lattitude);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=43.497875050000005&lon=16.300506692819848&appid=253211610f895c1f5e2cb1f94903adfd'));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }
  // Future<String> getData() async {
  //   final response = await http.get(Uri.parse(
  //       'https://api.openweathermap.org/data/2.5/weather?lat=43.497875050000005&lon=16.300506692819848&appid=253211610f895c1f5e2cb1f94903adfd'));
  //   return response.body;
  // }

  // Future<http.Response> getData() async {
  //   return http.get(Uri.parse(
  //       'https://api.openweathermap.org/data/2.5/weather?lat=43.497875050000005&lon=16.300506692819848&appid=253211610f895c1f5e2cb1f94903adfd'));
  // }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
