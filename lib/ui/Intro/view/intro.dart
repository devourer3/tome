import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_bloc.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_state.dart';
import 'package:tome/ui/utils/base_util.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});
  @override
  State<StatefulWidget> createState() => _IntroState();

}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemoryBloc, MemoryState>(builder: (context, state) {
      state.log();
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(tr('question_title')),
              TextField()
            ]
          ),
        )
      );
    });
  }



}