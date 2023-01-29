import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType inputType;
  final TextInputAction inputAction;
  final FocusNode? focusNode;
  final String? placeHolder;
  final String? hint;
  final double? height;
  final int? maxLines;
  final double? fontSize;
  final Function(String)? onLostFocus;
  final Function(String)? onTextChange;
  final Function(String)? onEditingComplete;

  const CustomTextField({
    super.key,
    required this.inputType,
    required this.inputAction,
    this.focusNode,
    this.height,
    this.hint,
    this.fontSize,
    this.maxLines,
    this.placeHolder,
    this.onLostFocus,
    this.onTextChange,
    this.onEditingComplete,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  _CustomTextFieldState();
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = widget.placeHolder ?? '';
    widget.focusNode?.addListener(() {
      if (widget.onLostFocus != null) widget.onLostFocus!(textController.value.text);
    });
    textController.addListener(() {
      if (widget.onTextChange != null) widget.onTextChange!(textController.value.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        maxLines: widget.maxLines ?? 1,
        controller: textController,
        focusNode: widget.focusNode,
        textInputAction: widget.inputAction,
        style: TextStyle(fontSize: widget.fontSize ?? 16),
        keyboardType: widget.inputType,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: widget.hint ?? '',
            // suffixIcon: Icon(Icons.search), //검색 아이콘 추가
            // contentPadding: EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
        ),
        inputFormatters: [
          // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          if (widget.inputType == TextInputType.number) FilteringTextInputFormatter.digitsOnly,
        ],
        onEditingComplete: () {
          if (widget.onEditingComplete != null) widget.onEditingComplete!(textController.value.text);
        },
        onChanged: (value) {
          if (value.length == 2 && value[0] == '0') {
            textController.text = value.substring(1); // 항상 커서가 맨 끝으로 이동 하도록
            textController.selection = TextSelection.collapsed(offset: textController.text.length);
          }
        },
      ),
    );
  }
}
