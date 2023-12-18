import 'package:flutter/material.dart';
import 'package:made_firebase/stream.dart';
import 'package:made_firebase/upload.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Upload(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Stream(),
            ),
          ],
        ),
      ),
    );
  }
}
