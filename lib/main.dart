import 'dart:developer';

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

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const MyApp(),
      routes: [
        GoRoute(
            name: 'endlink',
            path: 'endlink/:securityCode',
            builder: (BuildContext context, GoRouterState state) {
              final securityCode = state.pathParameters['securityCode']!;
              return EndlinkPage(securityCode: securityCode);
            }),
        GoRoute(
          name: 'search',
          path: 'search',
          builder: (_, __) => const EnterSecurityPage(),
        ),
      ],
    ),
  ],
);

void main() async {
  runApp(MaterialApp.router(routerConfig: router));

  final httpService = HttpServiceImpl();
  GetIt.I.registerSingleton<HttpService>(httpService);

  final mediaService = MediaServiceImpl(baseURL: 'https://endlink-api-beta.truvideo.com', httpService: httpService);
  GetIt.I.registerSingleton<MediaService>(mediaService);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    handleDeepLink(context);
    return MaterialApp(
      title: 'Endlink app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(
        color: Colors.blueAccent,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SizedBox(width: 200, child: Image.asset('assets/logo-color.png')),
        ),
      ),
    );
  }

  Future<void> handleDeepLink(BuildContext context) async {
    try {
      final link = await getInitialLink();

      const String baseLink = "https://beta.truvideo.com/w/";
      if (link?.contains(baseLink) ?? false) {
        final securityCode = link?.replaceFirst(baseLink, "");
        if (context.mounted) {
          router.pushReplacementNamed('endlink', pathParameters: <String, String>{'securityCode': securityCode ?? ""});
        }
        return;
      }
    } on PlatformException {
      log('ENDLINK: error');
    }
    if (context.mounted) {
      router.pushReplacementNamed('search');
    }
  }
}

class EnterSecurityPage extends StatefulWidget {
  const EnterSecurityPage({super.key});

  @override
  State<EnterSecurityPage> createState() => _EnterSecurityPageState();
}

class _EnterSecurityPageState extends State<EnterSecurityPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/logo-color.png', height: 100.0, width: 100.0),
          const SizedBox(height: 16.0),
          const Text(
            'Enter Repair Order Code',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              hintText: 'Enter code here',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              router.pushReplacementNamed('endlink', pathParameters: <String, String>{'securityCode': textEditingController.value.text});
            },
            child: const Text('Go'),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Enter the code for the repair order and click "Go" to load the details.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
        ],
      ),
    ));
  }
}
