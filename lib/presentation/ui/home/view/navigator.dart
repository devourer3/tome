import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomNavigator extends StatefulWidget {
  final Widget page;
  final Key navigatorKey;
  const CustomNavigator({Key? key, required this.page, required this.navigatorKey}) : super(key: key);


  @override
  CustomNavigatorState createState() => CustomNavigatorState();
}


class CustomNavigatorState extends State<CustomNavigator> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (_) => MaterialPageRoute(builder: (context) => widget.page),
    );
  }
}

// 덕분에 개발 잘할 수 있었습니다.
// 제가 쓰다 보니까 맨 마지막 방법에서도 몇가지 문제점이 발견되었는데, 다른 분들도 참고 하시면 좋을 것 같아서 올려봅니다.
//
// 일단, pop을 할 때에 일반적인 방식으로 하게 되면 에러가 나서 navigatorKeyList에서 해당 NavigatorState를 들고 와서 pop을 해야 하고
//
// 두번째로는 tab 간에 전환시에 해당 tab이 위젯 트리에 올라와 있는 상태가 아니라 오류가 발생한다는 점입니다.
// 이렇게만 말하면 어려울 것 같은데, 예를 들어, 4번째 tab에서 어떤 버튼을 누르면 2번째 tab으로 전환 후에 2번째 tab에서의 어떤 화면으로 전환하고자 한다고 하면, tabController의 index를 임의로 바꾸어준 후에 2번째 navigatorKeyList에서 currentContext를 가져와서 push를 해야 하는데 2번째 page에 한번도 근접했던 적이 없다면 currentContext가 null이라며 오류 메세지를 띄워주게 됩니다. 이는 아직 widget tree에 해당 화면의 customNavigator가 그려지지 않아서 발생하는 문제였고, 전 일단 50mill second마다 확인하는 식으로 해결했습니다.
//
// 세번째로는 scaffold가 앱 내에서 하나밖에 없어서 조금 불편합니다. flutter run --route로 특정화면에 접근하는 부분이 어렵고 다른 화면을 push할 때에 배경에 이전 화면의 잔상이 남아 있는 경우가 빈번히 발생해서 push하는 새로운 page에 배경색을 덧입혀 해결했습니다.
//
// 내용이 좀 길었는데 정말 덕분에 개발 잘 할 수 있었습니다. 감사합니다.