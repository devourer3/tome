import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tome/data/db/model/memory.dart';
import 'package:tome/domain/local/memory_repository.dart';
import 'package:tome/presentation/bloc/memory/memory_bloc.dart';
import 'package:tome/presentation/bloc/memory/memory_event.dart';
import 'package:tome/presentation/bloc/memory/memory_state.dart';
import 'package:tome/presentation/ui/base/elavated_button/elevated_button.dart';
import 'package:tome/presentation/ui/base/space/space.dart';
import 'package:tome/presentation/ui/base/textField/textField.dart';
import 'package:tome/presentation/ui/constants/colors.dart';
import 'package:tome/presentation/ui/constants/routes.dart';
import 'package:tome/presentation/ui/utils/theme_util.dart';
import 'package:tome/presentation/ui/utils/ui_util.dart';

class Intro extends StatefulWidget {
  final MemoryRepository memoryRepository;
  final FocusNode focus = FocusNode();
  Intro({super.key, required this.memoryRepository});

  @override
  State<StatefulWidget> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  String question = "";
  String answer = "";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    UiUtil.showLoading(true);
    final memoryCnt = widget.memoryRepository.getMemoryCount();
    memoryCnt.then((value) {
      UiUtil.showLoading(false);
      if (value != 0) {
        Navigator.popAndPushNamed(context, Routes.urlHome);
        return;
      }
      setState(() {
        _isLoading = false;
        question = "";
        answer = "";
      });
    }).onError((error, stackTrace) {
      UiUtil.showLoading(false);
      setState(() {
        _isLoading = false;
        question = "";
        answer = "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemoryBloc, MemoryState>(builder: (blocContext, state) {
      return _isLoading
          ? Container()
          : Scaffold(
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
                                  Navigator.popAndPushNamed(context, Routes.urlHome),
                                },
                              )
                            : const SizedBox(),
                      ),
                    ],
                  )));
    });
  }
}
