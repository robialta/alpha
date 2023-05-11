import 'package:alpha/common/constant/colors.dart';
import 'package:alpha/common/widget/gradient_text.dart';
import 'package:alpha/screens/transaction_screen/widgets/deposit_form.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _currentIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {
    _controller =
        TabController(length: 3, vsync: this, initialIndex: _currentIndex);
    _screens = [
      const DepositForm(),
      _withdrawalForm(),
      _withdrawalForm(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GradientText(
            'Transactionsr',
            // style: const TextStyle(
            //     fontSize: 36,
            //     height: 1,
            //     fontWeight: FontWeight.w700,
            //     fontFamily: 'SpaceGrotesk'),
            gradient: LinearGradient(colors: [
              const Color(0xFFCFE1FD).withOpacity(0.9),
              const Color(0xFFFFFDE1).withOpacity(0.9),
            ]),
          ),
          const SizedBox(
            height: 19,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: grey200,
                border: Border.all(color: grey300)),
            child: TabBar(
              isScrollable: false,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              controller: _controller,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: primary,
              ),
              labelColor: grey1100,
              unselectedLabelColor: grey1100,
              indicatorColor: primary,
              indicatorPadding: const EdgeInsets.all(2),
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              tabs: const [
                Tab(text: 'Deposit'),
                Tab(text: 'Withdrawal'),
                Tab(text: 'History'),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(child: _screens.elementAt(_currentIndex))
        ],
      ),
    );
  }

  Widget _withdrawalForm() {
    return Container();
  }
}
