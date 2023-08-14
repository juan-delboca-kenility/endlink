import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:enterprise_endlink/model/endlink_model.dart';
import 'package:enterprise_endlink/model/video_model.dart';
import 'package:enterprise_endlink/service/media/_interface.dart';
import 'package:enterprise_endlink/widget/screen/endlink/bloc/endlink_bloc.dart';
import 'package:enterprise_endlink/widget/screen/endlink/card.dart';
import 'package:enterprise_endlink/widget/screen/endlink/navigation_card.dart';
import 'package:enterprise_endlink/widget/screen/endlink/video_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

class EndlinkPage extends StatelessWidget {
  /// The route name.
  static const String routeName = '/DealerSignInView';

  //#region Initailizers

  /// {@macro dealer_sign_in_view}
  const EndlinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EndlinkBloc()..add(GetEnlinkModel()),
      child: const _Body(),
    );
  }
}

class _Body extends StatefulHookWidget {
  const _Body({super.key});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final initialUrl = context.select((EndlinkBloc bloc) => bloc.state.url);
    final EndlinkBloc bloc = context.read<EndlinkBloc>();
    final error = context.select((EndlinkBloc bloc) => bloc.state.error);

    // if (error) {
    //   bloc.add(UpdateError(error: false));
    //   _showErrorMessage(context);
    // }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const VideoCard(),
                  const SizedBox(
                    height: 5,
                  ),
                  const NavigationCard(),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomCard(
                      padding: 5,
                      radius: 50,
                      child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              border: Border.all(color: Colors.transparent),
                              borderRadius: const BorderRadius.all(Radius.circular(50))),
                          child: const Center(
                              child: Text(
                            "\$  Pay Now",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )))),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Want TruVideo for your business?",
                          style: TextStyle(
                            fontSize: 12,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () => _launchURL(),
                        child: const Text(
                          "Click here",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Powered by -",
                          style: TextStyle(
                            fontSize: 12,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 70,
                        child: Image.asset('assets/logo-color.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          initialValue: initialUrl,
                          onChanged: (value) {
                            final bloc = context.read<EndlinkBloc>();
                            bloc.add(UpdateUrl(url: value));
                          },
                        )),
                        IconButton(
                            onPressed: () => bloc.add(GetEnlinkModel()),
                            icon: const Icon(
                              Icons.send,
                              size: 35,
                              color: Colors.blueAccent,
                            ))
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  _showErrorMessage(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
            backgroundColor: Colors.white,
            content: SizedBox(
              width: 200,
              height: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Expanded(
                          child: Text(
                        'Error',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                      )),
                      GestureDetector(
                        onTap: () {
                          if (mounted) {
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("ErrorFetching the data"),
                ],
              ),
            ),
          );
        });
  }

  void _launchURL() async {
    Uri url = Uri.dataFromString("https://truvideo.com/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
