import 'package:alpha/app/widget_support.dart';
import 'package:alpha/auth/widgets/phone_name_form.dart';
import 'package:alpha/common/constant/styles.dart';
import 'package:alpha/common/widget/animation_click.dart';
import 'package:alpha/common/widget/app_bar_cpn.dart';
import 'package:alpha/screens/account_screen/account_screen.dart';
import 'package:alpha/screens/contract_screen/contract_screen.dart';
import 'package:alpha/screens/dashboard_screen/dashboard_screen.dart';
import 'package:alpha/screens/transaction_screen/transaction_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';

class MainScreenWrapper extends StatefulWidget {
  const MainScreenWrapper({super.key});

  @override
  State<MainScreenWrapper> createState() => _MainScreenWrapperState();
}

class _MainScreenWrapperState extends State<MainScreenWrapper> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    listWidget = [
      DashboardScreen(
        key: UniqueKey(),
      ),
      const ContractScreen(),
      const TransactionScreen(),
      const AccountScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser?.displayName == null
        ? PhoneNameForm(
            goToSignInPage: () {},
            onDonde: () {
              setState(() {
                listWidget[0] = DashboardScreen();
              });
            },
          )
        : Scaffold(
            key: _scaffoldKey,
            endDrawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: const EdgeInsets.all(16),
                children: [
                  ListTile(
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text('Sign out'),
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Are you sure to sign out'),
                          actions: [
                            ElevatedButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                if (context.mounted) {
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text('Sign out'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBarCpn(
              left: AnimationClick(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Image.asset(logoApp, width: 32, height: 32),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          'Alpha Hedge Fund',
                          style: headline(color: Colors.white),
                        )),
                  ],
                ),
              ),
              right: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Image.asset(chatCircleText, width: 24, height: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Image.asset(bellSimple, width: 24, height: 24),
                  ),
                  AnimationClick(
                    function: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Image.asset(
                        circlesFour,
                        width: 24,
                        height: 24,
                        color: grey1100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: listWidget.elementAt(_currentIndex),
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: grey300,
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  onTap: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                  items: [
                    AppWidget.createItemNav(
                        context, houseSimple, houseSimple, 'Dashboard',
                        hasContainer: true),
                    AppWidget.createItemNav(context, timer, timer, 'Contract',
                        hasContainer: true),
                    AppWidget.createItemNav(
                        context, cardholder, cardholder, 'Transaction',
                        hasContainer: true),
                    AppWidget.createItemNav(context, user, user, 'Account',
                        hasContainer: true),
                  ],
                ),
              ),
            ),
          );
  }
}
