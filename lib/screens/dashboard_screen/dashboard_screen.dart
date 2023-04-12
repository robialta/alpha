import 'package:alpha/app/widget_support.dart';
import 'package:alpha/widgets/sparkline_widget.dart';
import 'package:alpha/widgets/stock_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common/constant/colors.dart';
import '../../common/constant/images.dart';
import '../../common/constant/styles.dart';
import '../../common/widget/animation_click.dart';
import '../../common/widget/gradient_text.dart';

List<Map<String, dynamic>> items = [
  <String, dynamic>{'icon': shield, 'title': 'Saving', 'onTap': () {}},
  <String, dynamic>{'icon': shield, 'title': 'Bill', 'onTap': () {}},
  <String, dynamic>{'icon': shield, 'title': 'P2P', 'onTap': () {}}
];
List<Map<String, dynamic>> transactions = [
  <String, dynamic>{
    'icon': clock,
    'title': 'Foody',
    'subTitle': 'Subtitle',
    'money': '-\$16.48',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': shoppingBag,
    'title': 'Shopping',
    'subTitle': 'Subtitle',
    'money': '-\$16.48',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': clock,
    'title': 'Foody',
    'subTitle': 'Subtitle',
    'money': '-\$16.48',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': shoppingBag,
    'title': 'Shopping',
    'subTitle': 'Subtitle',
    'money': '-\$16.48',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': shoppingBag,
    'title': 'Shopping',
    'subTitle': 'Subtitle',
    'money': '-\$16.48',
    'onTap': () {}
  },
];

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final User _user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final height = AppWidget.getHeightScreen(context);
    return ListView(
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            AnimationClick(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    avtMale,
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            GradientText(
              'Hi! ${_user.displayName ?? _user.email}',
              style: Theme.of(context).textTheme.headlineSmall,
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, left: 16),
          child: GradientText(
            'Your Total Balance \$1.000',
            style: Theme.of(context).textTheme.headlineSmall,
            gradient: LinearGradient(colors: [
              const Color(0xFFCFE1FD).withOpacity(0.9),
              const Color(0xFFFFFDE1).withOpacity(0.9),
            ]),
          ),
        ),
        SizedBox(
          height: height / 4,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            // itemCount: sendAgains.length,
            scrollDirection: Axis.horizontal,
            children: _contractBuilder(width),
            // separatorBuilder: (context, index) => const SizedBox(width: 8),
            // itemBuilder: (context, index) {
            //   return _contractBuilder(width, context, index);
            // },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, right: 24),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: GradientText(
                  'Stocks Market',
                  style: Theme.of(context).textTheme.titleLarge,
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
              ),
              const Spacer(),
              AnimationClick(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: grey200, borderRadius: BorderRadius.circular(24)),
                  child: Image.asset(
                    icKeyboardRight,
                    width: 16,
                    height: 16,
                    color: grey1100,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 0),
          itemCount: hotTrend.length,
          separatorBuilder: (context, index) => const SizedBox(height: 4),
          itemBuilder: (context, index) => AnimationClick(
            function: hotTrend[index]['onTap'],
            child: Container(
              width: width,
              padding: const EdgeInsets.all(24),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(16)),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotTrend[index]['title'],
                        style: headline(color: grey1100),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        hotTrend[index]['subTitle'],
                        style: caption1(color: grey600),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  const SizedBox(height: 60, child: SparklineWidget()),
                  const Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        hotTrend[index]['money'],
                        style: headline(color: grey1100),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: primary),
                        child: Text(
                          hotTrend[index]['rate'],
                          style: caption2(color: grey1100),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: height / 7,
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 4),
            itemBuilder: (context, index) => AnimationClick(
              function: items[index]['onTap'],
              child: Container(
                width: (width - 16) / 3,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(items[index]['icon'], width: 32, height: 32),
                    Text(
                      items[index]['title'],
                      style: body(color: grey1100),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, right: 24, bottom: 24),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: GradientText(
                  'Latest Transactions',
                  style: Theme.of(context).textTheme.titleLarge,
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
              ),
              const Spacer(),
              AnimationClick(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: grey200, borderRadius: BorderRadius.circular(24)),
                  child: Image.asset(
                    icKeyboardRight,
                    width: 16,
                    height: 16,
                    color: grey1100,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          itemCount: transactions.length,
          separatorBuilder: (context, index) => const SizedBox(height: 4),
          itemBuilder: (context, index) => AnimationClick(
            function: transactions[index]['onTap'],
            child: Container(
              width: width,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: grey200, borderRadius: BorderRadius.circular(16)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: grey300,
                          borderRadius: BorderRadius.circular(99)),
                      child: Image.asset(transactions[index]['icon'],
                          width: 24, height: 24)),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              transactions[index]['title'],
                              style: headline(color: grey1100),
                            ),
                            Text(
                              transactions[index]['money'],
                              style: headline(color: grey1100),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          transactions[index]['subTitle'],
                          style: caption1(color: grey600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 64),
      ],
    );
  }

  List<Widget> _contractBuilder(double width) {
    final contractsData = <Map<String, String>>[
      {'contractNAme': '30 Days Cntract', 'value': '\$300,000'},
      {'contractNAme': '30 Days Cntract', 'value': '\$300,000'},
    ];

    final List<Widget> widgets = [
      AnimationClick(
        child: Container(
          margin: const EdgeInsets.all(8),
          width: width / 3.5,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Image.asset(shield, width: 32, height: 32),
                ),
              ),
              Text('Main Wallet',
                  style: body(color: grey1100.withOpacity(0.5))),
              Text(
                '\$1,579.00',
                style: title3(color: grey1100),
              )
            ],
          ),
        ),
      ),
    ];

    for (final Map i in contractsData) {
      widgets.add(
        AnimationClick(
          child: Container(
            margin: const EdgeInsets.all(8),
            width: width / 3.5,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                color: primary, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Image.asset(fiatMoney1, width: 64, height: 64),
                  ),
                ),
                Text(i['contractNAme'],
                    style: body(color: grey1100.withOpacity(0.5))),
                Text(
                  i['value'],
                  style: title3(color: grey1100),
                )
              ],
            ),
          ),
        ),
      );
    }
    return widgets
      ..add(
        AnimationClick(
          function: () {},
          child: Container(
            margin: const EdgeInsets.all(8),
            width: width / 3.5,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              // color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: grey200,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Image.asset(cardholder, width: 32, height: 32),
                ),
                Text(
                  'Add Contract',
                  style: title3(color: grey1100),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
