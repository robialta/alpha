abstract class ContractState {
  final String? error;

  ContractState({this.error});
}

class ContractInitialState extends ContractState {}

class ContractLoadingState extends ContractState {}

class ContractLoadedState extends ContractState {
  ContractLoadedState() : super();
}

class ContractErrorState extends ContractState {
  ContractErrorState(Object error) : super(error: error.toString());
}
