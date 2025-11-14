import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoRegisterScreen extends StatefulWidget {
  const CupertinoRegisterScreen({super.key});

  @override
  State<CupertinoRegisterScreen> createState() =>
      _CupertinoRegisterScreenState();
}

class _CupertinoRegisterScreenState extends State<CupertinoRegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    final username = _usernameController.text;
    final email = _emailController.text;

    if (username.isEmpty || email.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Error'),
          content: const Text('Semua field harus diisi'),
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
        title: const Text('Register'),
        content: Text('Register: $username, $email'),
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
        middle: Text('Register'),
      ),
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
                child: Image.network(
                  'https://via.placeholder.com/150',
                  height: 150,
                  width: 150,
                ),
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
              // Email TextField
              CupertinoTextField(
                controller: _emailController,
                placeholder: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    CupertinoIcons.mail,
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
              // Register Button
              CupertinoButton.filled(
                onPressed: _handleRegister,
                child: const Text('Register'),
              ),
              const SizedBox(height: 24),
              // Divider
              Row(
                children: [
                  const Expanded(
                    child: Divider(thickness: 1),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'atau',
                      style: TextStyle(color: CupertinoColors.systemGrey),
                    ),
                  ),
                  const Expanded(
                    child: Divider(thickness: 1),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Login Navigation Button
              CupertinoButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Sudah punya akun? Login disini'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
