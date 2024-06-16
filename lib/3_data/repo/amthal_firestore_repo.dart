import 'package:amtha_sha3beya_admin/3_data/models/mathal.dart';

import '../services/amthal_firestore.dart';

class AmthalFirestoreRepo {
  final AmthalFirestore amthalFirestore = AmthalFirestore();

  Future<void> addMathal(Mathal mathal) async {
    await amthalFirestore.addMathal(mathal);
  }
}
