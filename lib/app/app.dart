import 'package:alpha/auth/sign_in.dart';
import 'package:alpha/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../common/constant/dark_mode.dart';

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
      title: 'Alpha',
      debugShowCheckedModeBanner: false,
      theme: lightMode(context),
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else if (snapshot.hasData) {
              // ignore: unused_local_variable
              final user = snapshot.data;

              return const MainScreenWrapper();
            } else {
              return const LoginView();
            }
          },
        ),
      ),
    );
  }
}

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitState());

  Future<void> signIn(String email, String password) async {
    emit(AuthenticationLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AuthenticationLoadedState(true));
    } catch (e) {
      emit(AuthenticationErrorState());
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}

abstract class AuthenticationState {
  AuthenticationState({this.isAuthenticated = false});

  final bool isAuthenticated;
}

class AuthenticationInitState extends AuthenticationState {
  AuthenticationInitState()
      : super(isAuthenticated: FirebaseAuth.instance.currentUser != null);
}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationLoadedState extends AuthenticationState {
  AuthenticationLoadedState(bool isAuth) : super(isAuthenticated: isAuth);
}

class AuthenticationErrorState extends AuthenticationState {}
