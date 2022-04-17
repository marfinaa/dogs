import 'package:flutter/material.dart';
import 'dogs.dart';

class DogsDetail extends StatefulWidget {
  final Dogs dogs;

  const DogsDetail({Key? key, required this.dogs}) : super(key: key);

  @override
  _DogsDetailState createState() {
    return _DogsDetailState();
  }
}

class _DogsDetailState extends State<DogsDetail> {

  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dogs.label),
      ),
      // 2
      body: SafeArea(
        // 3
        child: Column(
          children: <Widget>[
            // 4
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image:
              AssetImage(widget.dogs.imageUrl)),
            ),
            // 5
            const SizedBox(
              height: 4,
            ),
            // 6
            Text(
              widget.dogs.label,
              style: const TextStyle(fontSize: 28),
            ),
            // 7
            Expanded(
              // 8
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.dogs.descriptions.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.dogs.descriptions[index];
                  // 9
                  return Text('${ingredient.measure}', style: TextStyle(fontSize: 18),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}