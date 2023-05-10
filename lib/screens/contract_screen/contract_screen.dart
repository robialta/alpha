import 'package:alpha/common/constant/colors.dart';
import 'package:alpha/common/constant/images.dart';
import 'package:alpha/common/constant/styles.dart';
import 'package:alpha/common/widget/animation_click.dart';
import 'package:alpha/common/widget/gradient_text.dart';
import 'package:alpha/entities/contract_entity.dart';
import 'package:alpha/screens/contract_screen/cubit/contract_cubit.dart';
import 'package:alpha/screens/contract_screen/cubit/contract_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key});

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  late ContractCubit _contractCubit;
  List<ContractEntity>? _contracts;

  @override
  void initState() {
    _contractCubit = ContractCubit()..loadContract();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContractCubit>.value(
      value: _contractCubit,
      child: BlocBuilder<ContractCubit, ContractState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case ContractInitialState:
            case ContractLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ContractErrorState:
              return Center(
                child: Text(state.error!),
              );
            case ContractLoadedState:
              _contracts = state.contracts;
              break;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GradientText(
                    'Balance',
                    style: const TextStyle(
                        fontSize: 24,
                        height: 1,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SpaceGrotesk'),
                    gradient: LinearGradient(colors: [
                      const Color(0xFFCFE1FD).withOpacity(0.9),
                      const Color(0xFFFFFDE1).withOpacity(0.9),
                    ]),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  '\$12,860.44',
                  style: title3(color: grey1100),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: _contracts!.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) => AnimationClick(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          gradient: index == 0
                              ? LinearGradient(colors: [
                                  const Color(0xFFCFE1FD).withOpacity(0.9),
                                  const Color(0xFFFFFDE1).withOpacity(0.9),
                                ])
                              : null,
                          color: index == 0 ? null : colors[index - 1],
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _contracts![index].name,
                                style: title2(
                                    color: index == 0 ? grey100 : grey1100),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${_contracts![index].time} days',
                                style: body(
                                    color: index == 0
                                        ? grey200.withOpacity(0.5)
                                        : grey1100.withOpacity(0.5)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                'From ${_contracts![index].profit.first}% to ${_contracts![index].profit.last}% profit in a day',
                                style: subhead(
                                    color: index == 0 ? grey100 : grey1100),
                              ),
                              const SizedBox(width: 8),
                              Image.asset(
                                arrowUpRight,
                                width: 16,
                                height: 16,
                                color: index == 0 ? grey100 : grey1100,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

List<Color> colors = [primary, green, emerald1];
