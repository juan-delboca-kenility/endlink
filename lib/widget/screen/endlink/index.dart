import 'package:carousel_slider/carousel_slider.dart';
import 'package:enterprise_endlink/model/video_model.dart';
import 'package:enterprise_endlink/service/media/_interface.dart';
import 'package:enterprise_endlink/widget/screen/endlink/card.dart';
import 'package:enterprise_endlink/widget/screen/endlink/navigation_card.dart';
import 'package:enterprise_endlink/widget/screen/endlink/video_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

class EndlinkPage extends StatefulHookWidget {
  const EndlinkPage({super.key});

  @override
  State<EndlinkPage> createState() => _EndlinkPageState();
}

class _EndlinkPageState extends State<EndlinkPage> {
  String _parameter = '';

  @override
  void initState() {
    super.initState();
    _initDeepLinkListener();
  }

  Future<void> _initDeepLinkListener() async {
    try {
      final initialLink = await getInitialUri();
      if (initialLink != null) {
        _handleDeepLink(initialLink);
      }

      uriLinkStream.listen((Uri? uri) {
        if (!mounted) return;
        if (uri == null) return;
        _handleDeepLink(uri);
      });
    } on PlatformException {
      // Handle exceptions if necessary
    }
  }

  void _handleDeepLink(Uri uri) {
    setState(() {
      _parameter = uri.queryParameters['parameter'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
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
                )
              ],
            ),
          ),
        ),
      ),
    );
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
