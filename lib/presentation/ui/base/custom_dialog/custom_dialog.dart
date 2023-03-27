import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final String desc;
  final List<Widget> actionButtons;

  const CustomDialog({super.key, required this.title, required this.desc, required this.actionButtons });

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  _CustomDialogState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.desc),
      actions: widget.actionButtons,
    );
  }
}
