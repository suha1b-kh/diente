// check case status
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final CollectionReference acceptedRequestsCollection =
    FirebaseFirestore.instance.collection('acceptedRequests');
Future<String> checkCaseStatus() {
  return acceptedRequestsCollection
      .doc(FirebaseAuth.instance.currentUser!.uid)
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
  });
}
