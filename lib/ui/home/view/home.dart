import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tome/ui/constants/colors.dart';
import 'package:tome/ui/constants/routes.dart';
import 'package:tome/ui/home/view/navigator.dart';
import 'package:tome/ui/memory_list/view/memory_list.dart';
import 'package:tome/ui/settings/view/settings.dart';
import 'package:tome/ui/utils/theme_util.dart';

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
    //모바일 상단 상태 바 높이 값
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: WillPopScope(
          onWillPop: () async {
            return !(await _navigatorKeyList[_currentIndex].currentState!.maybePop());
          },
          child: DefaultTabController(
            initialIndex: 0,
            length: _pages.length, // 탭 개수
            child: Scaffold(
              body: TabBarView(
                children: _pages.map(
                  (page) {
                    int index = _pages.indexOf(page);
                    return CustomNavigator(page: page, navigatorKey: _navigatorKeyList[index]);
                  },
                ).toList(),
              ),
              // bottomNavigationBar: BottomNavigationBar(
              //   onTap: (index) => setState(() {
              //     _currentIndex = index;
              //   }),
              //   selectedItemColor: ThemeColor(context: context, name: ColorName.active),
              //   items: const [
              //     BottomNavigationBarItem(icon: Icon(Icons.list_alt_sharp), label: '메모리'),
              //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: '세팅'),
              //   ],
              // ),
              bottomNavigationBar: BottomAppBar(
                notchMargin: 10,
                color: ThemeColor(context: context, name: ColorName.dark),
                shape: const AutomaticNotchedShape(
                  RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                child: TabBar(
                  isScrollable: false,
                  // indicatorColor: Colors.transparent,
                  indicator: UnderlineTabIndicator(insets: const EdgeInsets.symmetric(horizontal: 50), borderSide: BorderSide(color: ThemeColor(context: context, name: ColorName.active))),
                  indicatorWeight: 1,
                  automaticIndicatorColorAdjustment: true,
                  indicatorPadding: const EdgeInsets.only(bottom: 50),
                  indicatorColor: ThemeColor(context: context, name: ColorName.active),
                  labelColor: ThemeColor(context: context, name: ColorName.active),
                  unselectedLabelColor: ThemeColor(context: context, name: ColorName.icon),
                  labelStyle: const TextStyle(fontSize: 12),
                  onTap: (index) => setState(() {
                    _currentIndex = index;
                  }),
                  tabs: const [
                    Tab(icon: Icon(Icons.list_alt_sharp, size: 20), text: '메모리', height: 50, iconMargin: EdgeInsets.symmetric(vertical: 4)),
                    Tab(icon: Icon(Icons.settings, size: 20), text: '세팅', height: 50, iconMargin: EdgeInsets.symmetric(vertical: 4)),
                  ],
                ),
              )
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
       child: FloatingActionButton(
         autofocus: true,
         elevation: 10,
         shape: StadiumBorder(side: BorderSide(color: ThemeColor(context: context, name: ColorName.white), width: 2)),
         child: Text(tr('generate')),
         onPressed: () => Navigator.pushNamed(context, Routes.urlMemoryInput),
       ),
      ),
    );
  }
}
