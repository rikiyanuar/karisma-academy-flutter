import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final list = List.generate(50, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView Demo'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
          },
          child: ListView(
            children: [
              Text(
                'Contoh ListView Basic berisi Widget',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Text('Item 1 - Basic Widget'),
                  Text('Item 2 - Basic Widget'),
                ],
              ),
              Text(
                'Contoh ListView Horizontal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListViewHorizontal(list: list),
              SizedBox(height: 20),
              Text(
                'Contoh ListView Vertical',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListViewVertical(list: list),
            ],
          ),
        ),
      ),
    );
  }
}

class ListViewHorizontal extends StatelessWidget {
  final List list;

  const ListViewHorizontal({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: const EdgeInsets.all(8),
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                list[index],
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListViewVertical extends StatelessWidget {
  final List list;

  const ListViewVertical({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(list[index]),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
