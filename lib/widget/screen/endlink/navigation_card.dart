import 'package:enterprise_endlink/widget/screen/endlink/card.dart';
import 'package:enterprise_endlink/widget/screen/endlink/navigation_button.dart';
import 'package:flutter/material.dart';

class NavigationCard extends StatefulWidget {
  const NavigationCard({super.key});

  @override
  State<NavigationCard> createState() => _NavigationCardState();
}

class _NavigationCardState extends State<NavigationCard> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: 20,
      child: Column(children: [
        NavigationButton(icon: Icons.description_outlined, title: "Video Sumary", onPressed: ()=>{},),
        const SizedBox(height: 5,),
        NavigationButton(icon: Icons.remove_red_eye_outlined, title: "Inspection", onPressed: ()=>{},),
        const SizedBox(height: 5,),
        NavigationButton(icon: Icons.call, title: "Call Us", onPressed: ()=>{},),
        const SizedBox(height: 5,),
        NavigationButton(icon: Icons.calendar_today_outlined, title: "View Estimate", onPressed: ()=>{},),
      ],),
    );
  }
}
