import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolbox/classes/providers/desktop_navigation.dart';

class DesktopSidebar extends StatelessWidget {
  const DesktopSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<DesktopNavigation>(context);

    return Container(
      width: navigationProvider.isSidebarWide ? 200 : 70,
      color: Colors.blue[100],
      child: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.view_headline),
            onPressed: () => navigationProvider.toggleSidebarWidth(),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildNavigationItem(context, Icons.home, '登陆', '/login'),
                _buildNavigationItem(context, Icons.settings, 'OMS', '/oms'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem(
      BuildContext context, IconData icon, String title, String route) {
    final navigationProvider = Provider.of<DesktopNavigation>(context);

    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(icon),
          ),
        ],
      ),
      title:
          navigationProvider.isSidebarWide ? Center(child: Text(title)) : null,
      onTap: () {
        navigationProvider.setCurrentRoute(route);
        Navigator.pushNamed(context, route);
      },
      selected: navigationProvider.currentRoute == route,
    );
  }
}
