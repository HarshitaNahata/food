import 'package:flutter/material.dart';
import 'package:food/models/desidelight.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({required Key key, required this.item})
      : assert(item != null),
        super(
            key:
                key); //assert is used to check that if any item we pass is null or not

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} selected");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\₹${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
