import 'package:alpha/screens/contract_screen/cubit/contract_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContractCubit extends Cubit<ContractState> {
  ContractCubit() : super(ContractInitialState());

  Future<void> loadContract() async {
    emit(ContractLoadingState());
    try {
      emit(ContractLoadedState());
    } catch (e) {
      emit(ContractErrorState(e));
    }
  }
}
