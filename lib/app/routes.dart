import 'package:alpha/screens/assets_screen/assets_screen.dart';
import 'package:alpha/screens/contract_screen/contract_screen.dart';
import 'package:alpha/screens/dashboard_screen/dashboard_screen.dart';
import 'package:alpha/screens/transaction_screen/transaction_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String dashboard = '/dashboard';
  static const String assets = '/assets';
  static const String holds = '/schemas';
  static const String transactions = '/transactions';
  static const String release = '/withdraw/history';
  static const String login = '/login';
  static const String register = '/register';
  static const String menu = 'menu';

  static List<String> get getAll => [
        dashboard,
        assets,
        holds,
        transactions,
        menu,
      ];

  static List<ScreenRoute> screenRoutes = [
    ScreenRoute(dashboard, const DashboardScreen()),
    ScreenRoute(assets, const AssetsScreen()),
    ScreenRoute(holds, const ContractScreen()),
    ScreenRoute(transactions, const TransactionsScreen()),
    ScreenRoute(menu, Container())
  ];
}

class ScreenRoute {
  final String name;
  final Widget screen;

  ScreenRoute(this.name, this.screen);
}
