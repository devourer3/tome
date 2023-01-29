import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElevatedButtonView extends StatefulWidget {
  final String btnTitle;
  final Function() onPressed;
  final Function()? onLongPressed;
  final ButtonStyle? btnStyle;
  final double? width;
  final double? height;

  const ElevatedButtonView({super.key, required this.btnTitle, required this.onPressed, this.width, this.height, this.btnStyle, this.onLongPressed});

  @override
  State<ElevatedButtonView> createState() => _ElevatedButtonState();
}

class _ElevatedButtonState extends State<ElevatedButtonView> {
  _ElevatedButtonState();

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   dropdownValue = widget.btnTitle;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height,
      child: ElevatedButton(
        style: widget.btnStyle,
        onPressed: widget.onPressed,
        onLongPress: widget.onLongPressed,
        child: Text(widget.btnTitle),
      )
    );
  }
}
