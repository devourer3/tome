import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tome/ui/home/view/navigator.dart';
import 'package:tome/ui/memory_list/view/memory_list.dart';
import 'package:tome/ui/settings/view/settings.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pages = [MemoryList(), Settings()];
  final _navigatorKeyList = List.generate(2, (index) => GlobalKey<NavigatorState>());
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !(await _navigatorKeyList[_currentIndex].currentState!.maybePop());
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: _pages.map(
                  (page) {
                int index = _pages.indexOf(page);
                return CustomNavigator(
                  page: page,
                  navigatorKey: _navigatorKeyList[index],
                );
              },
            ).toList(),
          ),
          bottomNavigationBar: TabBar(
            isScrollable: false,
            indicatorPadding: const EdgeInsets.only(bottom: 74),
            automaticIndicatorColorAdjustment: true,
            onTap: (index) => setState(() {
              _currentIndex = index;
            }),
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.list_alt_sharp,
                ),
                text: '메모리',
              ),
              Tab(
                icon: Icon(
                  Icons.settings,
                ),
                text: '세팅',
              ),
            ],
          ),
        ),
      ),
    );
  }

}