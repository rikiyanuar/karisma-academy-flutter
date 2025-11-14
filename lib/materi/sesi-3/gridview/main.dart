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
          title: const Text('GridView Demo'),
        ),
        body: ListView(
          children: [
            Text(
              'Contoh GridView Count',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GridViewBasic(),
            SizedBox(height: 20),
            Text(
              'Contoh GridView Extent',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GridViewExtent(),
            SizedBox(height: 20),
            Text(
              'Contoh GridView Builder',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GridViewBuilder(),
          ],
        ),
      ),
    );
  }
}

class GridViewBasic extends StatelessWidget {
  const GridViewBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      children: List.generate(6, (index) {
        return Container(
          color: Colors.blue[100 * (index % 9 + 1)],
          child: Text(
            'Item ${index + 1}',
            style: TextStyle(fontSize: 18),
          ),
        );
      }),
    );
  }
}

class GridViewExtent extends StatelessWidget {
  const GridViewExtent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 100,
      childAspectRatio: 1.5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(9, (index) {
        return Container(
          color: Colors.green[100 * (index % 9 + 1)],
          child: Text(
            'Item ${index + 1}',
            style: TextStyle(fontSize: 18),
          ),
        );
      }),
    );
  }
}

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.5,
      ),
      itemCount: 12,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.red[100 * (index % 9 + 1)],
          child: Text(
            'Item ${index + 1}',
            style: TextStyle(fontSize: 18),
          ),
        );
      },
    );
  }
}
