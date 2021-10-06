import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:women_safety_app/DummyData/emergency_dummy_data.dart';
import 'package:women_safety_app/Model/emergency_model.dart';

class MapLargeScreen extends StatefulWidget {
  Emergency emergency;

  MapLargeScreen(this.emergency);

  @override
  State<MapLargeScreen> createState() => _MapLargeScreenState();
}

class _MapLargeScreenState extends State<MapLargeScreen> {
  List<Marker> allMarkers = [];
  bool _showNameBar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapToolbarEnabled: true,
            mapType: MapType.normal,
            markers: Set.from(allMarkers),
            onMapCreated: (GoogleMapController controller) {
              // add marker
              setState(() {
                allMarkers.add(Marker(
                    markerId: MarkerId('1'),
                    draggable: false,
                    position: LatLng(
                        widget.emergency.locationData.latitude!.toDouble(),
                        widget.emergency.locationData.longitude!.toDouble())));
              });
            },
            initialCameraPosition: CameraPosition(
                target: LatLng(
                    widget.emergency.locationData.latitude!.toDouble(),
                    widget.emergency.locationData.longitude!.toDouble()),
                zoom: 11.0,
                tilt: 0,
                bearing: 0),
          ),
          _showNameBar
              ? Positioned.fill(
                  bottom: 80,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Text(
                            widget.emergency.user.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                _showNameBar = false;
                              });
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            widget.emergency.user.phoneNumber,
                            style: TextStyle(color: Colors.white),
                          ),
                          leading: CircleAvatar(
                            radius: 25,
                            foregroundImage:
                                NetworkImage(widget.emergency.user.imageUrl),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
