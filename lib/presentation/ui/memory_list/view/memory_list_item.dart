import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tome/presentation/ui/constants/colors.dart';
import 'package:tome/presentation/ui/utils/theme_util.dart';
import 'package:tome/presentation/ui/utils/ui_util.dart';

class MemoryListItem extends StatelessWidget {
  final String question;
  final String answer;
  final double? width;
  const MemoryListItem({super.key, required this.question, required this.answer, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Card(
          color: ThemeColor(context: context, name: ColorName.base),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          // color: ThemeColor(context: context, name: ColorName.background),
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
                child: Text(question, style: TextStyle(fontSize: 24, color: ThemeColor(context: context, name: ColorName.reversal), fontWeight: FontWeight.w800)),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
                child: RichText(
                  text: TextSpan(
                    children: UiUtil.getDecoratedNumberSpanWidget(source: answer, decoratedColor: ThemeColor(context: context, name: ColorName.active)),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
