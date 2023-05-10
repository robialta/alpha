import 'package:alpha/entities/contract_entity.dart';

abstract class ContractState {
  final List<ContractEntity>? contracts;
  final String? error;

  ContractState({this.error, this.contracts});
}

class ContractInitialState extends ContractState {}

class ContractLoadingState extends ContractState {}

class ContractLoadedState extends ContractState {
  ContractLoadedState(List<ContractEntity> contracts)
      : super(contracts: contracts);
}

class ContractErrorState extends ContractState {
  ContractErrorState(Object error) : super(error: error.toString());
}
