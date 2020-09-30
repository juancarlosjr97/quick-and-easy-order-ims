import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class StockWidget extends StatefulWidget {
  @override
  StockWidgetApp createState() => new StockWidgetApp();

}

class StockWidgetApp extends State<StockWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').document('SLsKGBPKSCc5Q98xItU07KQf9vF3').collection('stock').snapshots(),
//      stream: Firestore.instance.collection('stock').snapshots(),

      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
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
    final record = Record.fromSnapshot(data);

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
          onTap: () =>
              record.reference.updateData({'instock': record.instock + 1}),
          onLongPress: () =>
              record.reference.updateData({'instock': record.instock - 1}),
        ),
      ),
    );
  }
}

class Record {
  final String item;
  final int instock;
  final DocumentReference reference;

  @override
  String toString() => "Record<$item:$instock>";

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['item'] != null),
        assert(map['instock'] != null),
        item = map['item'],
        instock = map['instock'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

