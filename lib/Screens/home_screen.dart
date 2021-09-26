import 'dart:math';

import 'package:flutter/material.dart';
import 'package:women_safety_app/DummyData/emergency_dummy_data.dart';
import 'package:women_safety_app/DummyData/user_dummy_data.dart';
import 'package:women_safety_app/Model/emergency_model.dart';
import 'package:location/location.dart';
import 'package:women_safety_app/Model/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime timeNow = DateTime.now();
  late double longitude;
  late double latitude;

  User currentuUser = users[0];

  Location location = Location();
  bool isGettingLocation = false;
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  Future _onLongPressEmergency() async {
    setState(() {
      isGettingLocation = true;
    });
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
    });

    print(_locationData.longitude);

    final newEmergencyMsg = Emergency(
      user: currentuUser,
      time: timeNow,
      isSolved: false,
      locationData: _locationData,
    );

    setState(() {
      emergencyCases.add(newEmergencyMsg);
    });

    setState(() {
      isGettingLocation = false;
    });

    print('Added Record');
    print(emergencyCases[0].locationData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: isGettingLocation ? Colors.green : Colors.red,
              ),
              child: isGettingLocation
                  ? Center(
                      child: Text(
                        'SENDING',
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {},
                      onLongPress: _onLongPressEmergency,
                      child: const Text('EMERGENCY'),
                      style: ElevatedButton.styleFrom(
                          elevation: 8.0,
                          primary: Colors.red,
                          shadowColor: Colors.black,
                          textStyle: const TextStyle(fontSize: 25),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20)),
                    ),
            ),
            TextButton(
              onPressed: () => {Navigator.pushNamed(context, "/1")},
              child: Text('Go to Dashboard'),
            )
          ],
        ),
      ),
    );
  }
}
