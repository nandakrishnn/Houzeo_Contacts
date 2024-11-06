import 'package:cloud_firestore/cloud_firestore.dart';

class ContactServices{
    Future<bool> addContactUser(
      Map<String, dynamic> userAdressInfo, dynamic id) async {
    try {
      await FirebaseFirestore.instance.collection("UserContacts").doc(id).set(userAdressInfo);
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic> userContact({
    required String id,
    required String firstName,
    required String secondName,
    required int userPhone ,
    required String email,
    required String nickName,

  }) {
    Map<String, dynamic> userContact = {
      'Id': id,
      'FirstName': firstName,
      'SecondName': secondName,
      'UserPhone': userPhone,
      'UserEmail': email,
      'UserNickName': nickName,
 
    };
    return userContact;
  }
  Stream<QuerySnapshot> getUserContactDetails() {
    return FirebaseFirestore.instance
        .collection('UserContacts')
        .snapshots();
  }

}