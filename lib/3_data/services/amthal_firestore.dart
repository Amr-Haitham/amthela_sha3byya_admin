import 'package:amtha_sha3beya_admin/3_data/models/mathal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AmthalFirestore {
  final CollectionReference amthalCollection =
      FirebaseFirestore.instance.collection('amthal');

  DocumentSnapshot? lastDocument;
  Future<void> addMathal(Mathal mathal) async {
    await amthalCollection.add(mathal.toMap());
  }
}
