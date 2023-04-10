import 'package:alpha/common/constant/styles.dart';
import 'package:alpha/common/widget/unfocus_click.dart';
import 'package:alpha/widgets/sparkline_widget.dart';
import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield.dart';

List<Map<String, dynamic>> items = [
  <String, dynamic>{
    'name': 'Dow Jones',
    'balance': '\$33,680.16',
    'rate': 14,
  },
  <String, dynamic>{
    'name': 'S&P 500',
    'balance': '\$33,680.16',
    'rate': 14,
  },
  <String, dynamic>{
    'name': 'US 30',
    'balance': '\$33,680.16',
    'rate': 14,
  }
];

List<Map<String, dynamic>> hotTrend = [
  <String, dynamic>{
    'icon': clock,
    'title': 'AAPL',
    'subTitle': 'Apple',
    'money': '-\$1,246.80',
    'rate': '+25%',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': clock,
    'title': 'AAPL',
    'subTitle': 'Apple',
    'money': '-\$1,246.80',
    'rate': '+25%',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': clock,
    'title': 'AAPL',
    'subTitle': 'Apple',
    'money': '-\$1,246.80',
    'rate': '+25%',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': clock,
    'title': 'AAPL',
    'subTitle': 'Apple',
    'money': '-\$1,246.80',
    'rate': '+25%',
    'onTap': () {}
  },
];

class Stock2 extends StatefulWidget {
  const Stock2({super.key});

  @override
  State<Stock2> createState() => _Stock2State();
}

class _Stock2State extends State<Stock2> {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final height = AppWidget.getHeightScreen(context);
    return UnfocusClick(
      child: Scaffold(
        appBar: AppBarCpn(
          center: Image.asset(
            logo,
            width: 48,
            height: 48,
          ),
          left: AnimationClick(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Image.asset(
                dotsSixVertical,
                width: 24,
                height: 24,
                color: grey1100,
              ),
            ),
          ),
          right: Row(
            children: [
              AnimationClick(
                child: Image.asset(
                  chatCircleText,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AnimationClick(
                  child: Image.asset(
                    bellSimple,
                    width: 24,
                    height: 24,
                    color: grey1100,
                  ),
                ),
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
              child: Center(
                child: IntrinsicWidth(
                  child: TextFieldCpn(
                    controller: searchCtl,
                    focusNode: searchFn,
                    hintText: 'Enter something…',
                    filled: true,
                    fillColor: grey200,
                    showPrefixIcon: true,
                    prefixIcon: icSearch,
                    colorPrefixIcon: grey600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 4,
              child: ListView.separated(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 4),
                itemBuilder: (context, index) => AnimationClick(
                  child: Container(
                    width: (width - 24) / 3,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: grey200,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            items[index]['name'],
                            style: subhead(color: grey1100),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            items[index]['balance'],
                            style: headline(color: grey1100),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              '+${items[index]['rate']}%',
                              style: footnote(color: green),
                            ),
                          ),
                          const Expanded(child: SparklineWidget())
                        ]),
                  ),
                ),
              ),
            ),
            AnimationClick(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48)),
                      child: Image.asset(
                        avtMale,
                        width: 48,
                        height: 48,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Portfolios',
                                style: footnote(color: grey1100),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: grey1100),
                                child: Text(
                                  '+12%',
                                  style: caption1(color: primary),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\$25,689.43',
                            style: headline(color: grey1100),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: GradientText(
                      'Hot Trend',
                      style: const TextStyle(
                          fontSize: 22,
                          height: 1,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SpaceGrotesk'),
                      gradient: LinearGradient(colors: [
                        const Color(0xFFCFE1FD).withOpacity(0.9),
                        const Color(0xFFFFFDE1).withOpacity(0.9),
                      ]),
                    ),
                  ),
                  AnimationClick(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: grey200,
                          borderRadius: BorderRadius.circular(24)),
                      child: Image.asset(
                        icKeyboardDown,
                        width: 16,
                        height: 16,
                        color: grey1100,
                      ),
                    ),
                  )
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
                            color: green,
                            borderRadius: BorderRadius.circular(16)),
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
            )
          ],
        ),
      ),
    );
  }
}
