import 'package:location/location.dart';
import 'package:women_safety_app/Model/user_model.dart';

class Emergency {
  User user;
  DateTime time;
  bool isSolved;
  LocationData locationData;

  Emergency({
    required this.user,
    required this.time,
    required this.isSolved,
    required this.locationData,
  });
}
