import 'package:flutter/material.dart';
import 'package:women_safety_app/DummyData/emergency_dummy_data.dart';
import 'package:women_safety_app/Model/emergency_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:women_safety_app/Screens/Admin/map_large_screen.dart';

class CaseDetailScreen extends StatefulWidget {
  final Emergency emergencyDetail;
  const CaseDetailScreen({Key? key, required this.emergencyDetail})
      : super(key: key);

  static final LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  @override
  State<CaseDetailScreen> createState() => _CaseDetailScreenState();
}

class _CaseDetailScreenState extends State<CaseDetailScreen> {
  List<Marker> allMarkers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 110.0,
                    foregroundImage:
                        NetworkImage(widget.emergencyDetail.user.imageUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Text(
                          widget.emergencyDetail.user.name.toUpperCase(),
                          style: TextStyle(fontSize: 26),
                        ),
                        Text(
                          widget.emergencyDetail.user.nic.toUpperCase(),
                          style: TextStyle(fontSize: 18, color: Colors.white54),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        color: Colors.white12,
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.green,
                              size: 30,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              widget.emergencyDetail.user.phoneNumber,
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white12,
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.mail,
                              color: Colors.green,
                              size: 30,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              widget.emergencyDetail.user.email,
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white12,
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.home,
                              color: Colors.green,
                              size: 30,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              widget.emergencyDetail.user.address,
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 20),
                    child: Column(
                      children: [
                        Text(
                          "Reported Location".toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Click somewhere on the map to view full screen",
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          height: 400,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(top: 20),
                          child: GoogleMap(
                            onTap: (var lat) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapLargeScreen(
                                          widget.emergencyDetail)));
                            },
                            mapType: MapType.normal,
                            markers: Set.from(allMarkers),
                            onMapCreated: (GoogleMapController controller) {
                              setState(() {
                                // add marker
                                allMarkers.add(Marker(
                                    markerId: MarkerId('Google'),
                                    draggable: false,
                                    position: LatLng(
                                        widget.emergencyDetail.locationData
                                            .latitude!
                                            .toDouble(),
                                        widget.emergencyDetail.locationData
                                            .longitude!
                                            .toDouble())));
                              });
                            },
                            initialCameraPosition: CameraPosition(
                                target: LatLng(
                                    widget
                                        .emergencyDetail.locationData.latitude!
                                        .toDouble(),
                                    widget
                                        .emergencyDetail.locationData.longitude!
                                        .toDouble()),
                                zoom: 11.0,
                                tilt: 0,
                                bearing: 0),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
