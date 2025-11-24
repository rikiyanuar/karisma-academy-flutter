import 'package:flutter/material.dart';

class Halaman4 extends StatefulWidget {
  const Halaman4({super.key});

  @override
  State<Halaman4> createState() => _Halaman4State();
}

class _Halaman4State extends State<Halaman4> {
  var listWarna = [
    Colors.red,
    Colors.blue,
    Colors.green,
    const Color.fromARGB(255, 0, 0, 0),
    Colors.orange,
    Colors.purple,
    const Color.fromARGB(255, 64, 208, 88),
    const Color.fromARGB(255, 159, 14, 167),
    Colors.indigo,
    Colors.lime,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View'),
      ),
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text("Contoh text dari ListTile"),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text("Contoh text dari ListTile"),
                trailing: Icon(Icons.chevron_right),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.separated(
              itemCount: listWarna.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  height: 110,
                  decoration: BoxDecoration(
                    color: listWarna[index],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Item ke-${index + 1}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Item ke-${index + 1}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
