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
  Future<bool> updatedUserDetails(
       String userFirstname, String userSecondname,String userEmail,int userPhone,String userNickname,String id,) async {
    try {
      await FirebaseFirestore.instance
          .collection('UserContacts')
          .doc(id)
          .update({'FirstName': userFirstname, 'SecondName': userSecondname,'UserEmail':userEmail,'UserPhone':userPhone,'UserNickName':userNickname});
      return true;
    } catch (e) {
      return false;
    }
  }
      Future<bool> addContactFav(
      Map<String, dynamic> userContactInfo, dynamic id) async {
    try {
      await FirebaseFirestore.instance.collection("UserFavourites").doc(id).set(userContactInfo);
      return true;
    } catch (e) {
      return false;
    }
  }
   Future<bool>removeUserSaved(String itemid)async{
   try {
      await FirebaseFirestore.instance.collection("UserFavourites").doc(itemid).delete();
    return true;
   } catch (e) {
     return false;
   }
}
 Future<bool> isAlreadyFavourited(String firstName, int userPhone) async {
  try {
   
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("UserFavourites")
        .where("FirstName", isEqualTo: firstName)
        .where("UserPhone", isEqualTo: userPhone)
        .get();
    return querySnapshot.docs.isNotEmpty?true:false;
  } catch (e) {
    print("Error checking favorite: $e");
    return false;
  }
}
}