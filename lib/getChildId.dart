import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getChildId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? childId = prefs.getString('childId');

  return childId;
}
