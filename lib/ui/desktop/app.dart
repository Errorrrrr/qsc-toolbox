import 'package:flutter/material.dart';
import 'package:toolbox/enum/website.dart';
import 'package:toolbox/ui/desktop/page/login.dart';
import 'package:toolbox/ui/desktop/page/oms.dart';

class DesktopApp extends StatelessWidget {
  const DesktopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const DesktopNavigation(),
    );
  }
}

class DesktopNavigation extends StatefulWidget {
  const DesktopNavigation({super.key});

  @override
  State<DesktopNavigation> createState() => _DesktopNavigationState();
}

class _DesktopNavigationState extends State<DesktopNavigation> {
  var selectedIndex = Website.oms;
  @override
  Widget build(BuildContext context) {
    Widget page;
    var login = Website.login;
    var oms = Website.oms;
    switch (selectedIndex) {
      case Website.login:
        page = const Login();
        break;
      case Website.oms:
        page = const OMS();
        break;
      default:
        debugPrint('default');
        page = const Login();
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: Row(
        children: [
          SafeArea(
              child: NavigationRail(
            extended: true,
            destinations: Website.values
                .map((e) => NavigationRailDestination(
                      icon: const Icon(Icons.home),
                      label: Text(e.info.name),
                    ))
                .toList(),
            selectedIndex: selectedIndex.index,
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = Website.values[index];
              });
            },
          )),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          )
        ],
      ));
    });
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

// class DesktopApp extends StatelessWidget {
//   const DesktopApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final navigationProvider = Provider.of<DesktopNavigation>(context);

//     return Scaffold(
//       body: Row(
//         children: [
//           const DesktopSidebar(), // PC端的侧边栏
//           Expanded(
//             child: Navigator(
//               key:
//                   GlobalKey<NavigatorState>(), // 确保 Navigator 的上下文保持在整个应用程序的范围内
//               onGenerateRoute: (settings) {
//                 WidgetBuilder builder;
//                 switch (settings.name) {
//                   case '/login':
//                     builder = (BuildContext _) => const Login();
//                     break;
//                   case '/oms':
//                     builder = (BuildContext _) => const OMS();
//                     break;
//                   // 添加其他路由的处理
//                   default:
//                     builder = (BuildContext _) => const Login();
//                 }
//                 return MaterialPageRoute(builder: builder, settings: settings);
//               },
//               initialRoute: navigationProvider.currentRoute,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
