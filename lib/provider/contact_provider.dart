import 'package:flutter/foundation.dart';

import '../db/db_helper.dart';
import '../model/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];

  getAllContacts() {
    //contactList.sort((c1, c2) => c1.id!.compareTo(c2.id!));
    DBHelper.getAllContacts().then((value) {
      contactList = value;
      notifyListeners();
    });
  }

  getAllFavoriteContacts() {
    DBHelper.getAllFavoriteContacts().then((value) {
      contactList = value;
      notifyListeners();
    });
  }

  loadContent(int index) {
    switch(index) {
      case 0:
        getAllContacts();
        break;
      case 1:
        getAllFavoriteContacts();
        break;
    }
  }

  Future<ContactModel> getContactById(int id) => DBHelper.getContactById(id);

  Future<bool> addNewContact(ContactModel contactModel) async {
    final rowId = await DBHelper.insertContact(contactModel);
    if(rowId > 0) {
      contactModel.id = rowId;
      contactList.add(contactModel);
      contactList.sort((c1, c2) => c1.name.compareTo(c2.name));
      notifyListeners();
      return true;
    }
    return false;
  }

  updateFavorite(int id, int value, int index) {
    DBHelper.updateFavorite(id, value).then((_) {
      contactList[index].favorite = !contactList[index].favorite;
      notifyListeners();
    });
  }

  deleteContact(int id) async {
    final rowId = await DBHelper.deleteContact(id);
    if(rowId > 0) {
      contactList.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }

}