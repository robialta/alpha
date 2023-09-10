import 'package:alpha/common/constant/styles.dart';
import 'package:alpha/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: 'Main Navigator');

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Smart Royal Shell',
      debugShowCheckedModeBanner: false,
      // theme: lightMode(context),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryScheme),
        fontFamily: 'SpaceGrotesk',
      ),
      home: const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: MainScreenWrapper(),
      ),
    );
  }
}

const MaterialColor primaryScheme = MaterialColor(
  primaryC,
  <int, Color>{
    50: Color(0xFFE0F2F1),
    100: Color(0xFFB2DFDB),
    200: Color(0xFF80CBC4),
    300: Color(0xFF4DB6AC),
    400: Color(0xFF26A69A),
    500: Color(primaryC),
    600: Color(0xFF00897B),
    700: Color(0xFF00796B),
    800: Color(0xFF00695C),
    900: Color(0xFF004D40),
  },
);

const primaryC = 0xFF1142D7;

abstract class AuthenticationState {
  AuthenticationState({this.isAuthenticated = false});

  final bool isAuthenticated;
}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationLoadedState extends AuthenticationState {
  AuthenticationLoadedState(bool isAuth) : super(isAuthenticated: isAuth);
}

class AuthenticationErrorState extends AuthenticationState {}
