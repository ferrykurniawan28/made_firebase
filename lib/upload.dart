import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final _nilaiTM = TextEditingController();
  final _nilaiUTS = TextEditingController();
  final _nilaiUAS = TextEditingController();

  void _submit() {
    final nilaiTM = int.parse(_nilaiTM.text);
    final nilaiUTS = int.parse(_nilaiUTS.text);
    final nilaiUAS = int.parse(_nilaiUAS.text);
    final nilaiAkhir = (nilaiTM + nilaiUTS + nilaiUAS) / 3;

    try {
      db.collection('Doc').doc('nilai').collection('nilai').add({
        'nilaiTM': nilaiTM,
        'nilaiUTS': nilaiUTS,
        'nilaiUAS': nilaiUAS,
        'nilaiAkhir': nilaiAkhir,
      });
    } catch (e) {
      print(e);
    }

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _nilaiTM.dispose();
    _nilaiUTS.dispose();
    _nilaiUAS.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: _nilaiTM,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nilai TM',
              ),
            ),
            TextFormField(
              controller: _nilaiUTS,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nilai UTS',
              ),
            ),
            TextFormField(
              controller: _nilaiUAS,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nilai UAS',
              ),
            ),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}
