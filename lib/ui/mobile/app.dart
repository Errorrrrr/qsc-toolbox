import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolbox/classes/providers/mobile_navigation.dart';
import 'package:toolbox/ui/mobile/page/login.dart';
import 'layout/side_bar.dart';

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<MobileNavigation>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile App'),
      ),
      drawer: const Drawer(
        child: MobileSidebar(), // 加载移动端侧边栏
      ),
      body: IndexedStack(
        index: navigationProvider.selectedIndex,
        children: const [
          Login(), // 登陆
        ],
      ),
    );
  }
}
