import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class Stream extends StatelessWidget {
  const Stream({super.key});

  // void _delete(){
  //   db.collection('Doc').doc('nilai').collection('nilai').doc().delete();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: db.collection('Doc').doc('nilai').collection('nilai').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!.docs ?? [];
          return SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(item['nilaiTM'].toString()),
                            subtitle: Text(item['nilaiUTS'].toString()),
                            leading: IconButton(
                              onPressed: () {
                                db
                                    .collection('Doc')
                                    .doc('nilai')
                                    .collection('nilai')
                                    .doc(item.id)
                                    .delete();
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
