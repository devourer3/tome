import 'package:flutter/widgets.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MemoryListState();
  }

}

class _MemoryListState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return const Text('세팅');
  }
}