import 'package:flutter/material.dart';
import 'package:wallpaper/views/screens/search_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "Wallpaper",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                  text: " App",
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ])),
    );
  }
}
