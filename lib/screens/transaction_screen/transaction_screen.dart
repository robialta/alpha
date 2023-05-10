import 'package:alpha/app/widget_support.dart';
import 'package:alpha/common/constant/colors.dart';
import 'package:alpha/common/constant/styles.dart';
import 'package:alpha/common/widget/animation_click.dart';
import 'package:alpha/common/widget/gradient_text.dart';
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

  @override
  void initState() {
    _controller =
        TabController(length: 3, vsync: this, initialIndex: _currentIndex);
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
            'Balance \$1.000',
            style: const TextStyle(
                fontSize: 36,
                height: 1,
                fontWeight: FontWeight.w700,
                fontFamily: 'SpaceGrotesk'),
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
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                _depositForm(),
                _withdrawalForm(),
                _withdrawalForm(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _depositForm() {
    return Container(
      decoration: BoxDecoration(
          color: grey200, borderRadius: BorderRadius.circular(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset(
                'Test',
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Test',
                  style: title3(color: grey1100),
                ),
              )
            ],
          ),
          AppWidget.divider(context,
              vertical: 16, color: grey300.withOpacity(0.3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Test',
                style: body(color: grey1100),
              ),
              AnimationClick(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), color: primary),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text(
                    'Payout',
                    style: headline(color: grey1100),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _withdrawalForm() {
    return Container();
  }
}
