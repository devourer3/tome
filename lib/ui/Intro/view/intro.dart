import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tome/data/db/model/memory.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_bloc.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_event.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_state.dart';
import 'package:tome/ui/base/elavated_button/elevated_button.dart';
import 'package:tome/ui/base/space/space.dart';
import 'package:tome/ui/base/textField/textField.dart';
import 'package:tome/ui/constants/colors.dart';
import 'package:tome/ui/utils/base_util.dart';
import 'package:tome/ui/utils/theme_util.dart';

class Intro extends StatefulWidget {
  Intro({super.key});
  final FocusNode focus = FocusNode();
  @override
  State<StatefulWidget> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  String question = "";
  String answer = "";

  @override
  void initState() {
    setState(() {
      question = "";
      answer = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemoryBloc, MemoryState>(builder: (blocContext, state) {
      state.log();
      return Scaffold(
          body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(tr('question_title')),
          const Space(height: 16),
          CustomTextField(
            inputType: TextInputType.text,
            inputAction: TextInputAction.next,
            hint: tr('question_hint'),
            maxLines: 1,
            fontSize: 32,
            onTextChange: (text) => {
              setState(() {question = text;})
            },
            onEditingComplete: (text) => {
              widget.focus.requestFocus()
            },
          ),
          if (question.isNotEmpty || answer.isNotEmpty) ...[
            const Space(height: 24),
            Text(tr('answer_title')),
            const Space(height: 16),
            CustomTextField(
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              focusNode: widget.focus,
              hint: tr('answer_hint'),
              maxLines: 1,
              fontSize: 32,
              onTextChange: (text) => {
                setState(() {answer = text;})
              },
              onEditingComplete: (text) => {

              },
            ),
            const Space(height: 24),
          ],
          if (question.isNotEmpty && answer.isNotEmpty) ...[
            Container(
                alignment: Alignment.center,
                child: ElevatedButtonView(
                    btnTitle: tr('save'),
                    height: 50,
                    btnStyle: ButtonStyle(backgroundColor: MaterialStatePropertyAll(ThemeColor(context: context, name: ColorName.active))),
                    onPressed: () => {
                      context.read<MemoryBloc>().add(MemoryAdded(MemoryItemModel.init(pMemoryQuestion: question, pMemoryAnswer: answer))),
                    })),
          ]
        ]),
      ));
    });
  }
}
