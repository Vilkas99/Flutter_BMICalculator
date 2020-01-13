import 'package:flutter/material.dart';

class WReusable extends StatelessWidget {
  final Color miColor;
  final Widget hijo;
  final Function alClick;

  WReusable({@required this.miColor, this.hijo, this.alClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: alClick,
      child: Container(
          margin: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 5,
          child: hijo,
          decoration: BoxDecoration(
              color: miColor, borderRadius: BorderRadius.circular(10.0))),
    );
  }
}
