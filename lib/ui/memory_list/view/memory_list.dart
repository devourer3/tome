import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tome/data/db/model/memory.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_bloc.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_state.dart';
import 'package:tome/ui/constants/colors.dart';
import 'package:tome/ui/constants/routes.dart';
import 'package:tome/ui/memory_list/view/memory_list_item.dart';
import 'package:tome/ui/utils/theme_util.dart';

class MemoryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MemoryListState();
  }
}

class _MemoryListState extends State<MemoryList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MemoryBloc, MemoryState>(
        builder: (context, state) {
          List<MemoryItemModel> list = state.memoryList;
          return Scaffold(
            body: CustomScrollView(slivers: [
              // const SliverAppBar(
              // Whether the app bar should remain visible at the start of the scroll view
              // 스크롤을 내렸을 때 앱바가 남아 있을 것이냐
              // pinned: false, // 사용자가 살짝 스크롤을 올렸을 때 appBar 의 전체를 보여줄 것인가
              // snap: false, // 헤더의 최대 높이
              // floating: true,
              // expandedHeight: 150.0, // 늘어나는 영역의 헤더 UI 정의
              // flexibleSpace: FlexibleSpaceBar(
              //   title: Text('Sliver한 appbar입니다'),
              // ),
              // ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(childCount: list.length, (context, index) {
                    MemoryItemModel listItem = list[index];
                    return MemoryListItem(question: listItem.question, answer: listItem.answer);
                  }))
            ]),
          );
        },
        listener: (context, state) {});
  }
}
