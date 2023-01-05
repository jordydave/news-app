import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/domain/entities/news.dart';
import 'package:technical_test/injection.dart' as di;
import 'package:technical_test/presentation/bloc/news_bloc.dart';
import 'package:technical_test/presentation/pages/home_page.dart';
import 'package:technical_test/presentation/pages/news_detail_page.dart';
import 'package:technical_test/presentation/pages/photo_view_page.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'utils/colors.dart';
import 'utils/utils.dart';

void main() {
  di.init();
  timeago.setLocaleMessages('id', timeago.IdMessages());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(di.locator()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        navigatorObservers: [routeObserver],
        theme: ThemeData(
          primarySwatch: primaryColor,
        ),
        home: const HomePage(),
        onGenerateRoute: (RouteSettings settings) {
          final args = settings.arguments;
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => const HomePage());
            case NewsDetailPage.routeName:
              return MaterialPageRoute(
                builder: (_) => NewsDetailPage(news: args as News?),
                settings: settings,
              );
            case PhotoViewPage.routeName:
              if (args is List) {
                return MaterialPageRoute(
                  builder: (_) => PhotoViewPage(
                    url: args[0],
                    tag: args[1],
                  ),
                  settings: settings,
                );
              }
              break;
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
          return null;
        },
      ),
    );
  }
}
