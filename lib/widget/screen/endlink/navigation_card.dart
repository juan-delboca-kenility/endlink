import 'package:enterprise_endlink/widget/screen/endlink/bloc/endlink_bloc.dart';
import 'package:enterprise_endlink/widget/screen/endlink/card.dart';
import 'package:enterprise_endlink/widget/screen/endlink/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCard extends StatefulWidget {
  const NavigationCard({super.key});

  @override
  State<NavigationCard> createState() => _NavigationCardState();
}

class _NavigationCardState extends State<NavigationCard> {
  @override
  Widget build(BuildContext context) {
    final int index = context.select((EndlinkBloc bloc) => bloc.state.currentIndex);
    final String summary = context.select((EndlinkBloc bloc) => bloc.state.endlinkModel.videos?[index].summary ?? "");
    return CustomCard(
      padding: 20,
      child: Column(
        children: [
          NavigationButton(
            icon: Icons.description_outlined,
            title: "Video Sumary",
            onPressed: () =>
                _showPopup(context, summary != "" ? summary : "This video dont have a summary yet, wait a few minutes and try again"),
          ),
          const SizedBox(
            height: 5,
          ),
          NavigationButton(
            icon: Icons.remove_red_eye_outlined,
            title: "Inspection",
            onPressed: () => _showSnackBar("To be implemented"),
          ),
          const SizedBox(
            height: 5,
          ),
          NavigationButton(
            icon: Icons.call,
            title: "Call Us",
            onPressed: () => _showSnackBar("To be implemented"),
          ),
          const SizedBox(
            height: 5,
          ),
          NavigationButton(
            icon: Icons.calendar_today_outlined,
            title: "View Estimate",
            onPressed: () => _showSnackBar("To be implemented"),
          ),
        ],
      ),
    );
  }

  void _showPopup(BuildContext context, String summary) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
            insetPadding: const EdgeInsets.all(20),
            backgroundColor: Colors.white,
            content: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Expanded(
                          child: Text(
                            'Video Summary',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(summary),
                ],
              ),
            ),
          );
        });
  }

  _showSnackBar(String message) {
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
                            'To be implemented',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("This feature will be implemented in newer versions"),
                ],
              ),
            ),
          );
        });
  }
}
