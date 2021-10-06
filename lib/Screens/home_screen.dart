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
  String notifyLongPressText = '';
  Color notifyLongPressColor = Colors.orange;

  Future _onLongPressEmergency() async {
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
      setState(() {
        isGettingLocation = false;
      });
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      isGettingLocation = true;
    });
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
    setState(() {
      notifyLongPressText = "MESSAGE SENT";
      notifyLongPressColor = Colors.green;
    });
  }

  void _onSinglePressEmergency() {
    setState(() {
      notifyLongPressColor = Colors.orange;
      notifyLongPressText = "LONG PRESS";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Image(
                        image:
                            const AssetImage('assets/images/police_logo.png'),
                        height: 250,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'SRILANKA POLICE DEPARTMENT',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Long press to send emergency message with your location',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: isGettingLocation ? Colors.green : Colors.red,
                    ),
                    child: isGettingLocation
                        ? const Center(
                            child: Text(
                              'SENDING',
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: _onSinglePressEmergency,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      notifyLongPressText,
                      style:
                          TextStyle(color: notifyLongPressColor, fontSize: 25),
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: () => {Navigator.pushNamed(context, "/1")},
                child: const Text('Go to Dashboard'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
