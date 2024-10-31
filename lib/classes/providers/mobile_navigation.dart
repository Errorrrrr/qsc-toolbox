import 'package:flutter/material.dart';

class MobileNavigation extends ChangeNotifier {
  bool _isSidebarWide = true; // 默认宽侧边栏
  int _selectedIndex = 1; // 默认选中的页面索引

  bool get isSidebarWide => _isSidebarWide;
  int get selectedIndex => _selectedIndex;

  void toggleSidebarWidth() {
    _isSidebarWide = !_isSidebarWide;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
