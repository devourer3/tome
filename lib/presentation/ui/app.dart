import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tome/domain/local/memory_repository.dart';
import 'package:tome/presentation/bloc/memory/memory_bloc.dart';
import 'package:tome/presentation/bloc/memory/memory_event.dart';
import 'package:tome/presentation/ui/home/view/home.dart';
import 'package:tome/presentation/ui/input/view/input.dart';
import 'package:tome/presentation/ui/intro/view/intro.dart';
import 'package:tome/presentation/ui/theme/theme.dart';

import 'constants/routes.dart';

class Tome extends StatelessWidget {
  Tome({ Key? key }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final memoryRepository = MemoryRepository();
    final dynamic routes = {
      Routes.urlIntro: (context) => Intro(memoryRepository: memoryRepository),
      Routes.urlHome: (context) => Home(),
      Routes.urlMemoryInput: (context) => Input(),
    };
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
        onGenerateRoute: (settings) {
          final String route = settings.name ?? '';
          switch (route) {
            case Routes.urlMemoryInput:
            case Routes.urlMemoryDetail:
              return PageRouteBuilder(
                  settings: settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                  pageBuilder: (context, animation, secondaryAnimation) => routes[route](context),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child)
              );
            default:
              return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (context, animation, secondaryAnimation) => routes[route](context),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
              );
          }
        },
      ),
    );
  }
}
