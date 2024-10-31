import 'package:flutter/material.dart';
import 'package:toolbox/api/oms.dart';
import 'package:toolbox/enum/website.dart';
import 'package:toolbox/hive/hive.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final widthCheck = MediaQuery.of(context).size.width > 750;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('Desktop App')),
      body: Center(
          child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widthCheck ? 3 : 1,
          childAspectRatio: widthCheck ? 1 / 1.1 : 2, // 设置每个card的宽高比
        ),
        itemCount: Website.values.length,
        itemBuilder: (context, index) {
          return Card(
            child: _SampleCard(
              website: Website.values[index],
            ),
          );
        },
      )),
    ));
  }
}

class _SampleCard extends StatelessWidget {
  _SampleCard({required this.website});

  final Website website;

  final accountController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 150, // 调整高度以适应两个输入框
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 标题
              SizedBox(
                height: 36,
                child: Text(
                  website.info.name,
                  style: const TextStyle(fontSize: 18),
                ),
              ),

              TextField(
                controller: accountController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.account_circle_outlined),
                    labelText: '账号'),
              ),
              const SizedBox(height: 16), // 输入框之间的间距
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.password_outlined),
                  labelText: '密码',
                ),
              ),
              const SizedBox(height: 16), // 输入框和按钮之间的间距
              OutlinedButton(
                  onPressed: () async {
                    final api = OMSApi();
                    try {
                      Map<String, dynamic> resp = await api.omsLogin(
                          accountController.text, passwordController.text);
                      HiveUtil.setMap('oms_login_info', resp);
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('登陆'))
            ],
          ),
        ),
      ),
    );
  }
}
