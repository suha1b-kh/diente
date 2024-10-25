import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/request.dart';

class RequestDatabaseServices {
  final CollectionReference requestsCollection =
      FirebaseFirestore.instance.collection('requests');
  final CollectionReference acceptedRequestsCollection =
      FirebaseFirestore.instance.collection('acceptedRequests');

  bool inReq=false;
  bool inAcceptedReq=false;
  String caseLocation="";

  RequestDatabaseServices();

  Future addRequest(Request req,String uid) async {
    return await requestsCollection
        .doc(uid)
        .set(req.toJson(req))
        .then((value) => print("request Added"))
        .catchError((error) => print("Failed to add request: $error"));
  }

  Future deleteRequest(String uid) async {
    await FirebaseFirestore.instance
        .collection('requests')
        .doc(uid)
        .delete()
        .then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error deleting document $e"),
        );
  }

  Future deleteAcceptedRequest(String uid) async {
    await acceptedRequestsCollection
        .doc(uid)
        .delete()
        .then(
          (doc) => print("Document deleted"),
      onError: (e) => print("Error deleting document $e"),
    );
  }

  Future<bool> checkCaseExistence(String uid) async {
    try {
        await requestsCollection.doc(uid).get().then((doc) {
          log("in req ${doc.exists.toString()}");
         if(doc.exists) {
           inReq =true;
         }
         });
        await acceptedRequestsCollection.doc(uid).get().then((doc) {
          log("in accepted ${doc.exists.toString()}");
          if(doc.exists) {
            inAcceptedReq=true;
          }
        });
      return inReq || inAcceptedReq;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<String> getCaseLocation (String uid)async{
    try {
      await requestsCollection.doc(uid).get().then((doc) {
        log("in req ${doc.exists.toString()}");
        if(doc.exists) {
          caseLocation= caseLocation.isEmpty?"requests":"";
        }
      });
      await acceptedRequestsCollection.doc(uid).get().then((doc) {
        log("in accepted ${doc.exists.toString()}");
        if(doc.exists) {
          caseLocation= caseLocation.isEmpty?"acceptedRequests":caseLocation;
        }
      });
      return caseLocation;

    } catch (e) {
      print(e.toString());
      return "";
    }
  }

  Future<Request> getRequest(String uid) async {
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

  Future getData(String uid) async {
    try {
      String collectionName = await getCaseLocation(uid);
      var snapshot;
      if(collectionName == "requests") {
        snapshot = await requestsCollection.doc(uid).get();
        if (snapshot?.exists) {
          log(snapshot['description'].toString());
          final description = snapshot['description'] as Map<String, dynamic>;
          return description["Name"];
        }
      } else if(collectionName == "acceptedRequests") {
        snapshot = await acceptedRequestsCollection.doc(uid).get();
        if (snapshot?.exists) {
          log(snapshot['caseDescription'].toString());
          final description = snapshot['caseDescription'] as Map<String, dynamic>;
          return description["Name"];
        }
      }
    } catch (e) {
      throw Exception('Error fetching document: $e');
    }
  }

  Future<String> getCaseStatus(String uid) async{
    String casStatus="";
    String caseLocation =await getCaseLocation(uid);
    if(caseLocation == "requests") {
      casStatus= "Waiting";
    } else if(caseLocation == "acceptedRequests")
      {
        casStatus=await acceptedRequestsCollection
            .doc(uid)
            .get()
            .then((doc) {
          if (doc.exists) {
            final data = doc.data() as Map<String, dynamic>?;
            if (data != null) {
              if (data['caseStatus'] == 'waiting') {
                return 'Waiting';
              } else if (data['caseStatus'] == 'accepted') {
                return 'Active';
              }
            }
          }
          return 'Finished';
            }
            );
      }
    return casStatus;

  }
}
