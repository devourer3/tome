import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tome/ui/constants/colors.dart';
import 'package:tome/ui/utils/base_util.dart';
import 'package:tome/ui/utils/theme_util.dart';

class BorderContainer extends StatelessWidget {
  final Function() clickListener;
  final SvgPicture icon;
  final double? height;
  final double? width;
  final String? title;
  ImageProvider<Object>? background;

  BorderContainer({required this.icon, required this.clickListener, this.title, this.width, this.height, this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: background != null ? BoxDecoration(image: DecorationImage(image: background!)) : const BoxDecoration(),
        child: DottedBorder(
          strokeWidth: 3,
          color: ThemeColor(context: context, name: ColorName.active),
          radius: const Radius.circular(10),
          dashPattern: const [10, 10],
          strokeCap: StrokeCap.butt,
          borderType: BorderType.Rect,
          child: InkWell(
            child: SizedBox(
                width: width,
                height: height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon,
                    if (title != null) ...[
                      Text(title ?? '')
                    ],
                  ],
                )),
            onTap: () => clickListener(), // 추가 버튼
          ),
        ));
  }
}
