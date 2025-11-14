import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'register_screen.dart';

class CupertinoLoginScreen extends StatefulWidget {
  const CupertinoLoginScreen({super.key});

  @override
  State<CupertinoLoginScreen> createState() => _CupertinoLoginScreenState();
}

class _CupertinoLoginScreenState extends State<CupertinoLoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final username = _usernameController.text;

    if (username.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Error'),
          content: const Text('Username tidak boleh kosong'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
      return;
    }

    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Login'),
        content: Text('Login sebagai: $username'),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      backgroundColor: CupertinoColors.systemBackground,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              // Logo
              Center(
                child: FlutterLogo(size: 100),
              ),
              const SizedBox(height: 40),
              // Username TextField
              CupertinoTextField(
                controller: _usernameController,
                placeholder: 'Username',
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    CupertinoIcons.person,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoColors.systemGrey4,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 16),
              // Password TextField
              CupertinoTextField(
                controller: _passwordController,
                placeholder: 'Password',
                obscureText: true,
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    CupertinoIcons.lock,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoColors.systemGrey4,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 24),
              // Login Button
              CupertinoButton.filled(
                onPressed: _handleLogin,
                child: const Text('Login'),
              ),
              const SizedBox(height: 24),
              // Divider
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'atau',
                      style: TextStyle(color: CupertinoColors.systemGrey),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 16),
              // Register Navigation Button
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const CupertinoRegisterScreen(),
                    ),
                  );
                },
                child: const Text('Belum punya akun? Daftar disini'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
