import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/request.dart';

class RequestDatabaseServices {
  final CollectionReference requestsCollection =
      FirebaseFirestore.instance.collection('requests');
  final String uid;
  bool exist = false;

  RequestDatabaseServices({required this.uid});

  Future addRequest(Request req) async {
    return await requestsCollection
        .doc(uid)
        .set({'description': req.caseDescription, 'isAccepted': req.isAccepted})
        .then((value) => print("request Added"))
        .catchError((error) => print("Failed to add request: $error"));
  }

  Future deleteRequest() async {
    //try
    await FirebaseFirestore.instance
        .collection('requests')
        .doc(uid) // Assuming patientName is used as the document ID
        .delete()
        .then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error deleting document $e"),
        );
  }

  Future<bool> checkExist(String uid) async {
    try {
      await requestsCollection.doc(uid).get().then((doc) {
        exist = doc.exists;
      });
      return exist;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }



  Future<Request> getRequest() async {
    try {
      DocumentSnapshot documentSnapshot =
          await requestsCollection.doc(uid).get();

      if (documentSnapshot.exists) {
        log(documentSnapshot.data().toString());
        final data = documentSnapshot.data() as Map<String, dynamic>?;
        log(data.toString());
        if (data != null) {
          Request requestData = Request.fromJson(data);
          print('Document data: $data');
          return requestData;
        } else {
          throw Exception('Document has no data');
        }
      } else {
        throw Exception('No document found');
      }
    } catch (e) {
      throw Exception('Error fetching document: $e');
    }
  }

  Future getData() async {
    try {
      var snapshot = await requestsCollection.doc(uid).get() ;
      if (snapshot.exists) {
        log(snapshot['description'].toString());
        final description = snapshot['description'] as Map<String, dynamic>;

        return description["Name"];
        //print(snapshot['toothNumber']);
      }
    } catch (e) {
      throw Exception('Error fetching document: $e');
    }
  }
}
