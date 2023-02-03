import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoryList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MemoryListState();
  }

}

class _MemoryListState extends State<MemoryList> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          // Whether the app bar should remain visible at the start of the scroll view
          // 스크롤을 내렸을 때 앱바가 남아 있을 것이냐
          pinned: false,
          // 사용자가 살짝 스크롤을 올렸을 때 appBar의 전체를 보여줄 것인가
          floating: true,
          // floating이랑 비슷합니다.. 솔직히 무슨 차이인지 모르겠습니다.
          snap: false,
          // 헤더의 최대 높이
          expandedHeight: 150.0,
          // 늘어나는 영역의 헤더 UI 정의
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Sliver한 appbar입니다'),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
              Container(height: 200, color: Colors.red),
              Container(height: 200, color: Colors.purple),
              Container(height: 200, color: Colors.green),
              Container(height: 200, color: Colors.orange),
              Container(height: 200, color: Colors.yellow),
            ]))
      ]
    );
  }
}
