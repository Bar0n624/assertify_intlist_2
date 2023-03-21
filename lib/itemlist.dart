import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'int_data.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(builder: (context, data, child) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: data.size,
        itemBuilder: (context, index) {
          final item = data.items[index];
          return GestureDetector(
            onLongPress: () => data.removeItem(index),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                  (index+1).toString()+") "+(item).toString()
              )
            ),
          );
        },
      );
    });
  }
}