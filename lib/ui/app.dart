import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tome/domain/local/memory_repository.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_bloc.dart';
import 'package:tome/ui/Intro/bloc/intro_memo_event.dart';
import 'package:tome/ui/Intro/view/intro.dart';
import 'package:tome/ui/home/view/home.dart';
import 'package:tome/ui/input/view/insert.dart';
import 'package:tome/ui/theme/theme.dart';

import 'constants/routes.dart';

class Tome extends StatelessWidget {
  const Tome({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final memoryRepository = MemoryRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MemoryBloc(memoryRepository: memoryRepository)..add(MemoryInit()),
        ),
        // BlocProvider(
        //   create: (_) => CreditCardAddBloc(
        //     creditCardRepository: cardRepository,
        //     cardSampleRepository: cardSampleRepository,
        //   )..add(EvCreditCardAddInit()),
        // ),
        // BlocProvider(create: (_) => CardDetailBloc(creditCardRepository: cardRepository)),
      ],
      child: MaterialApp(
        title: tr('app_title'),
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        initialRoute: Routes.urlIntro,
        builder: EasyLoading.init(builder: (context, child) {
          return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child ?? const Text(''));
        }),
        routes: {
          Routes.urlIntro: (_) => Intro(memoryRepository: memoryRepository),
          Routes.urlHome: (_) => Home(),
          Routes.urlMemoryInput: (_) => Input(),
        },
      ),
    );
  }
}
