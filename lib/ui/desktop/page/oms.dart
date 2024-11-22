import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OMS extends StatefulWidget {
  const OMS({super.key});
  @override
  State<OMS> createState() => _OMS();
}

class _OMS extends State<OMS> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate())
      ..loadHtmlString('https://www.baidu.com');
    super.initState();
    debugPrint('WebView initialized'); // 添加日志输出
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('webview'),
        ),
        body: WebViewWidget(
          controller: controller,
        ));
  }
}
