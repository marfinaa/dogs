import 'package:flutter/material.dart';

import 'dogs.dart';
import 'dogs_detail.dart';

void main() {
  runApp(const DogsApp());
}

class DogsApp extends StatelessWidget {
  const DogsApp({Key? key}) : super(key: key);

  // 1
  @override
  Widget build(BuildContext context) {
    // 2
    final ThemeData theme = ThemeData();
    // 3
    return MaterialApp(
      // 4
      title: 'Породы собак',
      // 5
      theme: ThemeData(scaffoldBackgroundColor: Colors.blueGrey,
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.brown,
        ),
      ),
      // 6
      home: const MyHomePage(title: 'Породы собак'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      // 2
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 3
      body: GridView.builder(
          // 5
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 2),
          itemCount: Dogs.samples.length,
          // 6
          itemBuilder: (BuildContext context, int index) {
            // 7
            return GestureDetector(
              // 8
              onTap: () {
                // 9
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // 10
                      return DogsDetail(dogs: Dogs.samples[index]);
                    },
                  ),
                );
              },
              // 11
              child: buildDogsCard(Dogs.samples[index]),
            );
          },
        ),
      );
  }

  Widget buildDogsCard(Dogs dogs) {
    return Card( color: Colors.white70,
      // 1
      elevation: 2.0,
      // 2
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      // 3
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // 4
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(dogs.imageUrl)),
            // 5
            const SizedBox(
              height: 14.0,
            ),
            // 6
            Text(
              dogs.label,
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w800,
              ),
            )
          ],
        ),
      ),
    );
  }
}