import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolbox/classes/providers/mobile_navigation.dart';

class MobileSidebar extends StatelessWidget {
  const MobileSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<MobileNavigation>(context);

    return Column(
      children: [
        IconButton(
          icon: Icon(navigationProvider.isSidebarWide
              ? Icons.arrow_back
              : Icons.arrow_forward),
          onPressed: () => navigationProvider.toggleSidebarWidth(),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildNavigationItem(context, Icons.home, 'Login', 0),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationItem(
      BuildContext context, IconData icon, String title, int index) {
    final navigationProvider = Provider.of<MobileNavigation>(context);

    return ListTile(
      leading: Icon(icon),
      title: navigationProvider.isSidebarWide ? Text(title) : null,
      onTap: () {
        Navigator.pop(context); // 关闭Drawer
        navigationProvider.setSelectedIndex(index);
      },
      selected: navigationProvider.selectedIndex == index,
    );
  }
}
