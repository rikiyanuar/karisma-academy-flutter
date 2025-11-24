import 'dart:math';

import 'package:flutter/material.dart';

class Halaman3 extends StatefulWidget {
  const Halaman3({super.key});

  @override
  State<Halaman3> createState() => _Halaman3State();
}

class _Halaman3State extends State<Halaman3> {
  int acak = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman 3'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Angka acak: $acak',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                int random = Random().nextInt(100);
                setState(() {
                  acak = random;
                });
              },
              child: Text("ACAK"),
            ),
          ],
        ),
      ),
    );
  }
}
