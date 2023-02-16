import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tome/data/db/model/memory.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_bloc.dart';
import 'package:tome/ui/base/border_container/border_container.dart';
import 'package:tome/ui/base/custom_dialog/custom_dialog.dart';
import 'package:tome/ui/base/elavated_button/elevated_button.dart';
import 'package:tome/ui/base/space/space.dart';
import 'package:tome/ui/base/textField/textField.dart';
import 'package:tome/ui/constants/colors.dart';
import 'package:tome/ui/constants/routes.dart';
import 'package:tome/ui/utils/theme_util.dart';
import 'package:tome/ui/utils/ui_util.dart';

import '../../Intro/bloc/intro_memo_event.dart';

class Input extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  final FocusNode focus = FocusNode();
  String question = "";
  String answer = "";
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: FittedBox(fit: BoxFit.none, child: Text(tr('generate_question_title'), style: const TextStyle(fontSize: 18))),
          backgroundColor: ThemeColor(context: context, name: ColorName.background),
          elevation: 0,
          // actions: [
          //   IconButton( // 카드 삭제
          //     onPressed: () {
          //       // 삭제 버튼
          //       showDialog(
          //           context: context,
          //           builder: (context) {
          //             return CustomDialog(title: tr('card_remove_title'), desc: tr('card_remove_desc'), actionButtons: [
          //               TextButton(
          //                 onPressed: () {},
          //                 child: Text(tr('yes')),
          //               ),
          //               TextButton(
          //                 onPressed: () => Navigator.pop(context, 'Cancel'),
          //                 child: Text(tr('no')),
          //               ),
          //             ]);
          //           });
          //     },
          //     icon: const Icon(Icons.delete),
          //   ),
          // ],
        ),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Space(height: 32),
                  Text(tr('enter_question')),
                  const Space(height: 16),
                  CustomTextField(
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    hint: tr('question_hint'),
                    maxLines: 1,
                    fontSize: 32,
                    onTextChange: (text) => {
                      setState(() {
                        question = text;
                      })
                    },
                    onEditingComplete: (text) => {focus.requestFocus()},
                  ),
                  const Space(height: 40),
                  Text(tr('enter_answer')),
                  const Space(height: 16),
                  CustomTextField(
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    focusNode: focus,
                    hint: tr('answer_hint'),
                    maxLines: 1,
                    fontSize: 32,
                    onTextChange: (text) => {
                      setState(() {
                        answer = text;
                      })
                    },
                    onEditingComplete: (text) => {},
                  ),
                  const Space(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BorderContainer(
                          height: 120,
                          width: deviceWidth / 3,
                          icon: UiUtil.getSvgFromPath(filename: 'camera.svg', width: 20, height: 20, color: ThemeColor(context: context, name: ColorName.active), alignment: Alignment.center),
                          title: tr('question_picture'),
                          clickListener: () => {print('whoo!!')}),
                      BorderContainer(
                          height: 120,
                          width: deviceWidth / 3,
                          icon: UiUtil.getSvgFromPath(filename: 'camera.svg', width: 20, height: 20, color: ThemeColor(context: context, name: ColorName.active), alignment: Alignment.center),
                          title: tr('question_picture'),
                          clickListener: () => {print('whoo!!')})
                    ],
                  )
                ])),
          ),
          ElevatedButtonView(
            btnTitle: tr('save'),
            height: 50,
            btnStyle: ButtonStyle(backgroundColor: MaterialStatePropertyAll(ThemeColor(context: context, name: ColorName.active))),
            onPressed: () => {
              context.read<MemoryBloc>().add(MemoryAdded(MemoryItemModel.init(pMemoryQuestion: question, pMemoryAnswer: answer))),
              Navigator.popAndPushNamed(context, Routes.urlHome),
            },
          )
        ]));
  }

  @override
  void initState() {
    print('input memory - initState');
  }

  @override
  void activate() {
    print('input memory - activate');
  }
}
