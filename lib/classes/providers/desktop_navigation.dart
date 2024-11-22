import 'package:flutter/material.dart';

// class DesktopNavigation extends ChangeNotifier {
//   bool _isSidebarWide = true; // 默认宽侧边栏
//   String _currentRoute = '/login'; // 默认路由

//   bool get isSidebarWide => _isSidebarWide;
//   String get currentRoute => _currentRoute;

//   void toggleSidebarWidth() {
//     _isSidebarWide = !_isSidebarWide;
//     notifyListeners();
//   }

//   void setCurrentRoute(String route) {
//     _currentRoute = route;
//     notifyListeners();
//   }
// }

class DesktopNavigation extends StatelessWidget {
  const DesktopNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        SafeArea(
            child: NavigationRail(
          extended: false,
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('登陆'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              label: Text('OMS'),
            ),
          ],
          selectedIndex: 0,
          onDestinationSelected: (index) {
            debugPrint('selected: $index');
          },
        )),
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: const GeneratorPage(),
          ),
        )
      ],
    ));
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10),
      ],
    ));
  }
}
