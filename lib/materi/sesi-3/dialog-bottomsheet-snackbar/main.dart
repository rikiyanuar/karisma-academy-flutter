import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DialogBottomSheetSnackBarPage(),
    );
  }
}

class DialogBottomSheetSnackBarPage extends StatelessWidget {
  const DialogBottomSheetSnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog, BottomSheet & SnackBar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => showAlertDialog(context),
              child: const Text('Show Alert Dialog'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => showMyBottomSheet(context),
              child: const Text('Show Bottom Sheet'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => showMySnackBar(context),
              child: const Text('Show SnackBar'),
            ),
          ],
        ),
      ),
    );
  }

  void showMyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: const Center(
            child: Text('This is a Bottom Sheet'),
          ),
        );
      },
    );
  }

  void showMySnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('This is a SnackBar'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Dialog'),
          content: const Text('This is an alert dialog.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
