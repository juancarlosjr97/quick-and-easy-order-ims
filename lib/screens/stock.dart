import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StockRecord {
  late String item = "";
  late int instock = 0;
  late DocumentSnapshot data;

  StockRecord(DocumentSnapshot snapshot) {
    data = snapshot;
    getRecord();
  }

  isNull(String value) {}

  getRecord() {
    if (data.exists) {
      item = (data.data() as Map)["item"] ?? "";
      instock = (data.data() as Map)["instock"] ?? 0;
    }
  }
}

class StockWidget extends StatefulWidget {
  const StockWidget({Key? key}) : super(key: key);

  @override
  StockWidgetApp createState() => StockWidgetApp();
}

class StockWidgetApp extends State<StockWidget> {
  String stockDocument = "";

  StockWidgetApp() {
    print(FirebaseAuth.instance.currentUser!.uid);
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('stock')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const LinearProgressIndicator();
        return _buildList(context, snapshot.data!.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    var record = StockRecord(data);
    record.getRecord();

    return Padding(
      key: ValueKey(record.item),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.item),
          trailing: Text(record.instock.toString()),
          onTap: () => record.data.reference
              .set({'item': record.item, 'instock': record.instock + 1}),
          onLongPress: () => record.data.reference
              .set({'item': record.item, 'instock': record.instock - 1}),
        ),
      ),
    );
  }
}
