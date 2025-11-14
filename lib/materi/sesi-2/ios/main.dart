import 'package:flutter/cupertino.dart';
import 'login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'iOS Chat App',
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
      ),
      home: const CupertinoLoginScreen(),
    );
  }
}
