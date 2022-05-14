import 'package:cloud_firestore/cloud_firestore.dart';

class DataController {
  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
    await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('post')
        .where('JOB_TITLE', isGreaterThanOrEqualTo: queryString)
        .where('JOB_TITLE', isLessThan: queryString + '\uf8ff')
        .get();
  }
  Future profileData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('user')
        .get();
  }

}
