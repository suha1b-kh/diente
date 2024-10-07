import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/student/data/models/report_model.dart';
import 'package:diente/student/data/models/student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;
//  chooseCase() {
//   db.collection('requests').where('status', isEqualTo: 'waiting').get().then((value) {
//     value.docs.forEach((element) {
//       print(element.data());
//     });
//   });
//   return;
// }

