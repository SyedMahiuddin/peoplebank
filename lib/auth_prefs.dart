import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setLoginStatus(bool status) async {
  final prefs= await SharedPreferences.getInstance();
  return prefs.setBool('isloggedin', status);

}

getLoginStatus() async{
  final prefs= await SharedPreferences.getInstance();
  return prefs.getBool('isloggedin')?? false;
}