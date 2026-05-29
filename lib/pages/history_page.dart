import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _historyPageState();
  }
}

class _historyPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Container(color: Colors.blue));
  }
}
