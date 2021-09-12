import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MaterialApp(
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String latitudeData = "";
  String longtudeData = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    final Geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitudeData = ' ${Geoposition.latitude}';
      longtudeData = ' ${Geoposition.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(latitudeData),
          Text(longtudeData),
        ],
      ),
    );
  }
}
