import 'package:amtha_sha3beya_admin/3_data/models/mathal.dart';
import 'package:amtha_sha3beya_admin/3_data/repo/amthal_firestore_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'amthal_state.dart';

class AmthalCubit extends Cubit<AmthalState> {
  AmthalCubit() : super(AmthalInitial());

  AmthalFirestoreRepo amthalFirestoreRepo = AmthalFirestoreRepo();

  void addMathal(Mathal mathal) async {
    emit(AmthalLoading());
    try {
      await amthalFirestoreRepo.addMathal(mathal);
      emit(AmthalLoaded());
    } catch (e) {
      emit(AmthalError());
    }
  }
}
