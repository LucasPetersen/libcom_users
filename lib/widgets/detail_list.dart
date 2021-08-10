import 'package:flutter/material.dart';

class DetailList extends StatelessWidget {
  const DetailList({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Text(
            name,
            textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          Expanded(child: Text(value, textAlign: TextAlign.left, style: TextStyle(fontSize: 20))),
        ],
      ),
    );
  }
}
