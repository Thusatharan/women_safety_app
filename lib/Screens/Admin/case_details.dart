import 'package:flutter/material.dart';
import 'package:women_safety_app/Model/emergency_model.dart';

class CaseDetailScreen extends StatelessWidget {
  final Emergency emergencyDetail;
  const CaseDetailScreen({Key? key, required this.emergencyDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 60),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 110.0,
                  foregroundImage: NetworkImage(emergencyDetail.user.imageUrl),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Text(
                        emergencyDetail.user.name.toUpperCase(),
                        style: TextStyle(fontSize: 26),
                      ),
                      Text(
                        emergencyDetail.user.nic.toUpperCase(),
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
                            emergencyDetail.user.phoneNumber,
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
                            emergencyDetail.user.email,
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
                            emergencyDetail.user.address,
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
                        "Reported Location",
                        style: TextStyle(fontSize: 18, color: Colors.redAccent),
                      ),
                      Container(
                        width: 300,
                        color: Colors.redAccent,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Latitude',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  emergencyDetail.locationData.latitude
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Latitude',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  emergencyDetail.locationData.longitude
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ],
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
    ));
  }
}
