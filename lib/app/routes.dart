import 'package:alpha/auth/sign_in.dart';
import 'package:alpha/auth/sign_up.dart';
import 'package:alpha/screens/account_screen/account_screen.dart';
import 'package:alpha/screens/contract_screen/contract_screen.dart';
import 'package:alpha/screens/dashboard_screen/dashboard_screen.dart';
import 'package:alpha/screens/transaction_screen/transaction_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String dashboard = '/dashboard';
  static const String contract = '/contract';
  static const String transactions = '/transactions';
  static const String account = '/account';
  static const String login = '/login';
  static const String register = '/register';

  static List<String> get getAll => [
        dashboard,
        contract,
        transactions,
        account,
        login,
        register,
      ];

  static List<ScreenRoute> screenRoutes = [
    ScreenRoute(dashboard, DashboardScreen()),
    ScreenRoute(contract, const ContractScreen()),
    ScreenRoute(transactions, const TransactionScreen()),
    ScreenRoute(account, const AccountScreen()),
    ScreenRoute(login, const LoginView()),
    ScreenRoute(register, const SignUpScreen()),
  ];
}

class ScreenRoute {
  final String name;
  final Widget screen;

  ScreenRoute(this.name, this.screen);
}
