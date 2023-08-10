import 'package:enterprise_endlink/service/http/_interface.dart';
import 'package:enterprise_endlink/service/http/http.dart';
import 'package:enterprise_endlink/service/media/_interface.dart';
import 'package:enterprise_endlink/service/media/index.dart';
import 'package:enterprise_endlink/widget/screen/endlink/index.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

void main() {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const MyApp(),
        routes: [
          GoRoute(
            path: 'endlink',
            builder: (_, __) => const EndlinkPage(),
          ),
        ],
      ),
    ],
  );
  runApp(MaterialApp.router(routerConfig: router));

  final httpService = HttpServiceImpl();
  GetIt.I.registerSingleton<HttpService>(httpService);


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EndlinkPage(),
    );
  }
}
