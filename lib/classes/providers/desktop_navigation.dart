import 'package:flutter/material.dart';

class DesktopNavigation extends ChangeNotifier {
  bool _isSidebarWide = true; // 默认宽侧边栏
  String _currentRoute = '/login'; // 默认路由

  bool get isSidebarWide => _isSidebarWide;
  String get currentRoute => _currentRoute;

  void toggleSidebarWidth() {
    _isSidebarWide = !_isSidebarWide;
    notifyListeners();
  }

  void setCurrentRoute(String route) {
    _currentRoute = route;
    notifyListeners();
  }
}
