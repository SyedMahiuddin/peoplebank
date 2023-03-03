import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/contact_model.dart';
import '../provider/contact_provider.dart';

class ContactDetailsPage extends StatefulWidget {
  static const String routeName='/contact_details';

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  int? id;
  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as int;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Person Details'),),
      body: Center(
        child: Consumer<ContactProvider>(
          builder: (context, provider, _) => FutureBuilder<ContactModel>(
            future: provider.getContactById(id!),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                final contact = snapshot.data;
                return ListView(
                  children: [
                    Image.file(File(contact!.image!), width: double.infinity, height: 300, fit: BoxFit.cover,),
                    ListTile(
                      title: Text(contact.name),
                      subtitle: Text(contact.number),
                    ),
                  ],
                );
              }
              if(snapshot.hasError) {
                return const Text('Failed to fetch data');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
