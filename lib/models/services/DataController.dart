import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  Future<QuerySnapshot> requestData(String? queryStringgg) async {
    return FirebaseFirestore.instance
        .collection('request')
        .where('USER_ID', isEqualTo: queryStringgg)
    //.where('JOB_TITLE', isLessThan: queryString + '\uf8ff')
        .get();
  }


  Future queryDataFilter(String locationFilter, bool durationFilter, RangeValues salary) async {
    return FirebaseFirestore.instance
        .collection('post')
        .where('JOB_LOCATION', isEqualTo: locationFilter)
        .where('JOB_SALARY', isGreaterThanOrEqualTo: salary.start)
        .where('JOB_SALARY', isLessThanOrEqualTo: salary.end)
        .where('MORE_THAN_DAY', isEqualTo: durationFilter)
        .get();
  }

}
