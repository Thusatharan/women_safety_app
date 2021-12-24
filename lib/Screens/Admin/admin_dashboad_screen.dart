import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_app/DummyData/emergency_dummy_data.dart';
import 'package:intl/intl.dart';

import 'case_details.dart';

class AdminDashboardScreen extends StatefulWidget {
  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  Color containerColorSolved = const Color.fromRGBO(0, 219, 95, 0.4);
  Color containerColorUnSolved = const Color.fromRGBO(247, 47, 80, 0.4);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  'EMERGENCY CASES',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 64,
                          child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        )),
                        Expanded(
                            child: Container(
                          height: 64,
                          child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "NAME",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        )),
                        Expanded(
                            child: Container(
                          height: 64,
                          child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "DATE",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                        )),
                        Expanded(
                            child: Container(
                          height: 64,
                          child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'TIME',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                        )),
                      ],
                    ),
                  ),
                  ListView.builder(
                    reverse: true,
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: emergencyCases.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CaseDetailScreen(
                                        emergencyDetail: emergencyCases[index],
                                      )),
                            );
                          },
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 64,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                        foregroundImage: NetworkImage(
                                            emergencyCases[index]
                                                .user
                                                .imageUrl))),
                              )),
                              Expanded(
                                  child: Container(
                                height: 64,
                                color: emergencyCases[index].isSolved
                                    ? containerColorSolved
                                    : containerColorUnSolved,
                                child: Align(
                                    alignment: Alignment.center,
                                    child:
                                        Text(emergencyCases[index].user.name)),
                              )),
                              Expanded(
                                child: Container(
                                    height: 64,
                                    color: emergencyCases[index].isSolved
                                        ? containerColorSolved
                                        : containerColorUnSolved,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(DateFormat('yyyy-MM-dd')
                                          .format(emergencyCases[index].time)),
                                    )),
                              ),
                              Expanded(
                                  child: Container(
                                height: 64,
                                color: emergencyCases[index].isSolved
                                    ? containerColorSolved
                                    : containerColorUnSolved,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(DateFormat('hh:mm aa')
                                      .format(emergencyCases[index].time)),
                                ),
                              )),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
