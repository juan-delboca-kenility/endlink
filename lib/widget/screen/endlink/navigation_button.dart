import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onPressed;

  const NavigationButton({super.key, required this.icon, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(children: [
          Icon(icon,),
          const SizedBox(width: 10,),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 16),)),
          const Icon(Icons.chevron_right_outlined,),
        ],),
      ),
    );
  }
}
