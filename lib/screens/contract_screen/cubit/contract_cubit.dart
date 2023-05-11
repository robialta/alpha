import 'package:alpha/entities/contract_entity.dart';
import 'package:alpha/screens/contract_screen/cubit/contract_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContractCubit extends Cubit<ContractState> {
  ContractCubit() : super(ContractInitialState());

  Future<void> loadContract() async {
    emit(ContractLoadingState());
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('contracts').get();
      emit(ContractLoadedState(ContractEntity.createListFrom(snapshot.docs)));
    } catch (e) {
      emit(ContractErrorState(e));
    }
  }
}
