import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:toolbox/hive/hive.dart';
import 'package:toolbox/ui/desktop/app.dart'; // 导入PC端的App
import 'package:toolbox/ui/desktop/page/oms.dart';
import 'package:toolbox/ui/mobile/app.dart'; // 导入移动端的App
import 'package:toolbox/ui/desktop/page/login.dart'; // 导入登录页面

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 确保 Flutter 框架在执行任何其他代码之前已完成初始化
  await Hive.initFlutter(); // 初始化 Hive 数据库
  await HiveUtil.getInstance('toolbox'); // 打开名为 toolbox 的 Hive Box
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AdaptiveApp(), // 自定义的适配组件
      routes: {
        '/login': (context) => const Login(),
        '/oms': (context) => const OMS(),
        // 添加其他路由
      },
    );
  }
}

// 自定义组件，负责在PC端和移动端之间进行切换
class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 检查宽度，以确定加载PC端还是移动端的App组件
        bool isDesktop = constraints.maxWidth > 600;

        if (isDesktop) {
          return const DesktopApp(); // 加载PC端App
        } else {
          return const MobileApp(); // 加载移动端App
        }
      },
    );
  }
}
