import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolbox/classes/providers/desktop_navigation.dart';
import 'package:toolbox/ui/desktop/page/login.dart';
import 'package:toolbox/ui/desktop/page/oms.dart'; // 假设这是你的OMS页面
import 'layout/side_bar.dart'; // 导入侧边栏

class DesktopApp extends StatelessWidget {
  const DesktopApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<DesktopNavigation>(context);

    return Scaffold(
      body: Row(
        children: [
          const DesktopSidebar(), // PC端的侧边栏
          Expanded(
            child: Navigator(
              key:
                  GlobalKey<NavigatorState>(), // 确保 Navigator 的上下文保持在整个应用程序的范围内
              onGenerateRoute: (settings) {
                WidgetBuilder builder;
                switch (settings.name) {
                  case '/login':
                    builder = (BuildContext _) => const Login();
                    break;
                  case '/oms':
                    builder = (BuildContext _) => const OMS();
                    break;
                  // 添加其他路由的处理
                  default:
                    builder = (BuildContext _) => const Login();
                }
                return MaterialPageRoute(builder: builder, settings: settings);
              },
              initialRoute: navigationProvider.currentRoute,
            ),
          ),
        ],
      ),
    );
  }
}
