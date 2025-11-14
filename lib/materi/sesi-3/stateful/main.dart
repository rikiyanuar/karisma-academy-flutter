import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateful Widget Life Cycle'),
        ),
        body: const Center(
          child: LifeCycleDemo(label: 'Demo Widget'),
        ),
      ),
    );
  }
}

class LifeCycleDemo extends StatefulWidget {
  final String label;
  const LifeCycleDemo({super.key, required this.label});

  @override
  State<LifeCycleDemo> createState() => _LifeCycleDemoState();
}

class _LifeCycleDemoState extends State<LifeCycleDemo>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  int value = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('initState');
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    // contoh async aman — tapi perhatikan mounted sebelum setState
    Future.delayed(Duration(seconds: 1)).then((_) {
      if (!mounted) return;
      setState(() => value = 1);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant LifeCycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget: old=${oldWidget.label} new=${widget.label}');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Column(
      children: [
        Text('value: $value'),
        ElevatedButton(
          onPressed: () => setState(() => value++),
          child: Text('increment'),
        ),
      ],
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint('deactivate');
  }

  @override
  void dispose() {
    debugPrint('dispose');
    controller.dispose();
    super.dispose();
  }
}
