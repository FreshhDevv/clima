import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '253211610f895c1f5e2cb1f94903adfd';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double longitude;
  late double latitude;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.lattitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
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
    return Scaffold();
  }
}
