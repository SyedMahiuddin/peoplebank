import 'package:batch5_contact_app/auth_prefs.dart';
import 'package:batch5_contact_app/pages/contact_list_page.dart';
import 'package:batch5_contact_app/pages/login_page.dart';
import 'package:flutter/material.dart';
class LauncherPage extends StatefulWidget {
  const LauncherPage({Key? key}) : super(key: key);
  static const String routename='/launcher';

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  void initState() {
    // TODO: implement initState
    getLoginStatus().then((value){
      if(value)
        {
          Navigator.pushReplacementNamed(context, ContactListPage.routeName);
        }
      else
        {
          Navigator.pushReplacementNamed(context, LoginPage.routename);
        }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const CircularProgressIndicator(

        ),
      ),
    );
  }
}
