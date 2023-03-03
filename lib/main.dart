import 'package:batch5_contact_app/pages/contact_details_page.dart';
import 'package:batch5_contact_app/pages/contact_list_page.dart';
import 'package:batch5_contact_app/pages/new_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/contact_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ContactProvider() .. getAllContacts()),
    ],
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),


      initialRoute: ContactListPage.routeName,

      routes: {

        NewContactPage.routeName: (context)=>NewContactPage(),
        ContactListPage.routeName : (context)=>ContactListPage(),
        ContactDetailsPage.routeName:(context)=>ContactDetailsPage()
      },
    );
  }
}


