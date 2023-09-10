import 'package:alpha/common/constant/images.dart';
import 'package:alpha/common/constant/styles.dart';
import 'package:alpha/screens/rlease_screen/release_screen.dart';
import 'package:universal_html/html.dart' as html;
import 'package:alpha/app/routes.dart';
import 'package:flutter/material.dart';

class MainScreenWrapper extends StatefulWidget {
  const MainScreenWrapper({super.key});

  @override
  State<MainScreenWrapper> createState() => _MainScreenWrapperState();
}

class _MainScreenWrapperState extends State<MainScreenWrapper> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late String _route;

  @override
  void didChangeDependencies() {
    if (html.window.location.pathname! == '/') {
      _route = '/dashboard';
      html.window.history.pushState('data', 'title', _route);
    } else {
      _route = html.window.location.pathname!;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 14,
        title: Row(
          children: [
            Image.asset(
              mainLogo,
              width: 36,
            ),
            const SizedBox(
              width: 12,
            ),
            const Text(
              'Smart Royal Shell',
              style: TextStyle(color: Colors.black87),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: DropdownButton(
              value: 'English',
              items: const [
                DropdownMenuItem<String>(
                  value: 'English',
                  child: Text('English'),
                ),
                DropdownMenuItem<String>(
                  value: 'Germany',
                  child: Text('Germany'),
                ),
              ],
              onChanged: (val) {},
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0.05,
        toolbarHeight: 48,
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Drawer(
        elevation: 0.05,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: const Text('Smart Royal Shell'),
            ),
            ListTile(
              leading: const Icon(Icons.move_up_rounded),
              title: const Text('Release'),
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(MaterialPageRoute(
                      builder: (context) => const ReleaseScreen()));
              },
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            const ListTile(
              leading: Icon(Icons.support_agent_rounded),
              title: Text('Support Ticket'),
            ),
            const ListTile(
              leading: Icon(Icons.lock_reset),
              title: Text('Change Password'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  child: const Text('Logout')),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        elevation: 0.05,
        currentIndex: AppRoutes.getAll.indexOf(html.window.location.pathname!),
        onTap: (value) {
          if (AppRoutes.screenRoutes[value].name == 'menu') {
            _scaffoldKey.currentState?.openEndDrawer();
          } else {
            setState(() {
              _route = AppRoutes.screenRoutes[value].name;
              html.window.history.replaceState(_route, _route, _route);
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.data_thresholding_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Assets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.branding_watermark),
            label: 'Holds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
      ),
      body: AppRoutes.screenRoutes
          .firstWhere((element) => element.name == _route)
          .screen,
    );
  }
}
