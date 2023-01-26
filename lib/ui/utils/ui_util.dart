import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tome/ui/utils/theme_util.dart';

import '../constants/colors.dart';

class UiUtil {
  static void showLoading() {
    EasyLoading.show(status: 'Loading...');
  }

  static SvgPicture getSvgFromPath({required String path, required double width, required double height, required Color color, required Alignment alignment}) {
    return SvgPicture.asset('assets/icon/$path', width: width, height: height, color: color, alignment: alignment);
  }
  
  static Image getPictureFromPath({required String name, double? width, double? height}) {
    return Image.asset('assets/images/$name', fit: BoxFit.fitHeight, width: width, height: height);
  }

  static List<TextSpan> getDecoratedNumberSpanWidget({required String source, Color? decoratedColor, int? fontSize}) {
    var regex = RegExp(r'\d+(,\d+)*');
    var convertedStr = source.replaceAllMapped(regex, (match) {
      return '<deco>${match.group(0)}<deco>';
    });
    List<String> decoStmt = convertedStr.split('<deco>');
    return decoStmt.map((element) {
      if (regex.hasMatch(element)) {
        return TextSpan(text: element, style: TextStyle(color: decoratedColor));
      }
      return TextSpan(text: element);
    }).toList();
  }

  static void showToast({
    required BuildContext buildContext,
    required String langKey,
    ColorName backgroundColor = ColorName.background,
    ColorName textColor = ColorName.textStrong,
    ToastGravity toastGravity = ToastGravity.BOTTOM,
  }) {
    Fluttertoast.showToast(
        msg: tr(langKey),
        fontSize: 10,
        backgroundColor: ThemeColor(context: buildContext, name: backgroundColor),
        textColor: ThemeColor(context: buildContext, name: textColor),
        gravity: toastGravity,
        timeInSecForIosWeb: 1);
  }
}



