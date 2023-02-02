import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tome/data/db/model/memory.dart';
import 'package:tome/domain/local/memory_repository.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_bloc.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_event.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_state.dart';
import 'package:tome/ui/base/elavated_button/elevated_button.dart';
import 'package:tome/ui/base/space/space.dart';
import 'package:tome/ui/base/textField/textField.dart';
import 'package:tome/ui/constants/colors.dart';
import 'package:tome/ui/constants/routes.dart';
import 'package:tome/ui/utils/theme_util.dart';

class Intro extends StatefulWidget {
  final FocusNode focus = FocusNode();
  final MemoryRepository memoryRepository;

  Intro({ super.key, required this.memoryRepository });

  @override
  State<StatefulWidget> createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  String question = "";
  String answer = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      question = "";
      answer = "";
    });
    final memoryList = widget.memoryRepository.getAllMemory();
    memoryList.then((value) {
      if (value.isNotEmpty) {
        Navigator.pushNamed(context, Routes.urlHome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemoryBloc, MemoryState>(builder: (blocContext, state) {
        return Scaffold(
            body: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr('question_title')),
                    const Space(height: 10),
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
                      onEditingComplete: (text) => {widget.focus.requestFocus()},
                    ),
                    AnimatedOpacity(
                      opacity: question.isNotEmpty || answer.isNotEmpty ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (question.isNotEmpty || answer.isNotEmpty)
                            ? [
                          const Space(height: 24),
                          Text(tr('answer_title')),
                          const Space(height: 10),
                          CustomTextField(
                            inputType: TextInputType.text,
                            inputAction: TextInputAction.next,
                            focusNode: widget.focus,
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
                        ]
                            : [],
                      ),
                    ),
                    const Space(height: 30),
                    AnimatedOpacity(
                      opacity: question.isNotEmpty && answer.isNotEmpty ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 1000),
                      child: question.isNotEmpty && answer.isNotEmpty
                          ? ElevatedButtonView(
                        btnTitle: tr('save'),
                        height: 50,
                        btnStyle: ButtonStyle(backgroundColor: MaterialStatePropertyAll(ThemeColor(context: context, name: ColorName.active))),
                        onPressed: () => {
                          context.read<MemoryBloc>().add(MemoryAdded(MemoryItemModel.init(pMemoryQuestion: question, pMemoryAnswer: answer))),
                          Navigator.pushNamed(context, Routes.urlHome),
                        },
                      )
                          : const SizedBox(),
                    ),
                  ],
                )));
      }
    );
  }
}
